<?php

namespace App\Http\Resources;

use App\Service\UploadService;
use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class ErrorResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return abort(response()->json([
            'timestamp'=>Carbon::now(),
            'description'=>$this->description,
            'status'=>$this->status,
            'title'=>$this->title,
        ]), ((int)$this->status));
    }
}
