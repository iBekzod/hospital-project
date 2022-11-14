<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\AppointmentResource;
use App\Http\Resources\ErrorResource;
use App\Models\Appointment;
use App\Models\Error;
use App\Models\Identifier;
use App\Models\Period;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class AppointmentController extends BaseController
{
    public function users()
    {
        // dd(\DB::table('users')->get());
        return response()->json(['users'=>\DB::table('users')->get()]);
    }
    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        try {
            $appointments=Appointment::query();
            if($participant=$request->participant){
                $appointments=$appointments->where('participant', 'like', '%'.$participant.'%');
            }
            if($performer=$request->performer){
                $appointments=$appointments->where('performer', 'like', '%'.$performer.'%');
            }
            $appointments=$appointments->get();
            return response()->json([
                'count'=>count($appointments),
                'data'=>AppointmentResource::collection($appointments)
            ]);
        } catch (\Throwable $th) {
            return $this->failure(502);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $period_id=Str::uuid()->toString();
            $identifier_id=Str::uuid()->toString();
            $data=$request->all();
            $identifier=$data['identifier'];
            $period=$identifier[0]['period'];
            $identifier[0]['period']=$period_id;
            $identifier[0]['value']=$identifier_id;
            $data['identifier']=$identifier_id;
            $participants=[];
            foreach($data['participant'] as $participant){
                $participants[]=$participant['actor']['reference'];
            }
            $data['participant']=implode(',', $participants);
            $data['performer']=explode("/", $data['performer']['reference'])[1];
            // dd($period);
            $period=Period::create([
                'id'=>$period_id,
                'start'=>($period['start'])?Carbon::createFromFormat('Y-m-d', $period['start'])->toDateString():null,
                'end'=>($period['end'])?Carbon::createFromFormat('Y-m-d', $period['end'])->toDateString():null
            ]);
            $identifier=Identifier::create($identifier[0]);
            $appointment=Appointment::create($data);
        } catch (\Exception $e) {
            DB::rollback();
            return $this->failure(502);
        }
        DB::commit();
        return response()->json([new AppointmentResource($appointment)], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Appointment  $appointment
     * @return \Illuminate\Http\Response
     */
    public function show($appointment)
    {
        if(!is_string($appointment)){
            return $this->failure(400);;
        }
        try {
            if($appointment=Appointment::where('id', $appointment)->first()){
                return ["Appointment"=>new AppointmentResource($appointment)];
            }else{
                return $this->failure(404);
            }
        } catch (\Throwable $th) {
            return $this->failure(502);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Appointment  $appointment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $appointment)
    {
        if(!is_string($appointment)){
            return $this->failure(400);
        }
        try {
            if($appointment=Appointment::where('id', $appointment)->first()){
                if($data=$request["Appointment"][0]){
                    switch ($data['op']) {
                        case 'replace':
                            $appointment->update([
                                str_replace('/', '', $data['patch'])=>$data['value']
                            ]);
                            break;
                        default:
                            return $this->failure(400);
                            break;
                    }
                }
                return ["Appointment"=>new AppointmentResource($appointment)];
            }else{
                return $this->failure(404);
            }
        } catch (\Exception $e) {
            return $this->failure(502, $e->getMessage(), $e->getTraceAsString());
        }
    }
}
