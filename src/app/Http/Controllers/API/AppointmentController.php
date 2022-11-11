<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\AppointmentResource;
use App\Http\Resources\ErrorResource;
use App\Models\Appointment;
use App\Models\Error;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AppointmentController extends BaseController
{
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
            return AppointmentResource::collection($appointments);
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
        try {


        } catch (\Throwable $th) {
            return $this->failure(502);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Appointment  $appointment
     * @return \Illuminate\Http\Response
     */
    public function show($appointment)
    {

        try {
            if($appointment=Appointment::where('id', $appointment)->first()){
                return new AppointmentResource($appointment);
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
        try {
            if($appointment=Appointment::where('id', $appointment)->first()){
                if($data=$request["Appointment"]){
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
                return new AppointmentResource($appointment);
            }else{
                return $this->failure(404);
            }
        } catch (\Throwable $th) {
            return $this->failure(502);
        }
    }
}
