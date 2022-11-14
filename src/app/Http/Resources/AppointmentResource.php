<?php

namespace App\Http\Resources;

use App\Service\UploadService;
use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class AppointmentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $participants=explode(',',$this->participant);
        $participant_data=[];
        foreach($participants as $participant){
            $participant_data[]=['actor'=>['reference'=>$participant]];
        }
        $performer_data=['reference'=>'Organization/'.$this->performer];
        return [
            'id'=>$this->id,
            'identifier'=>new IdentifierResource($this->identifierRelation),
            'status'=>$this->status,
            'participant'=>$participant_data,
            'performer'=>$performer_data
        ];
    }


}
