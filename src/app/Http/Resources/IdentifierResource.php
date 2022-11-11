<?php

namespace App\Http\Resources;

use App\Service\UploadService;
use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class IdentifierResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'use'=>$this->use,
            'type'=>$this->type,
            'system'=>$this->system,
            'value'=>$this->value,
            'period'=> new PeriodResource($this->periodRelation),
            'assigner'=> $this->assigner
        ];
    }
}
