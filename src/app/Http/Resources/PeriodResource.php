<?php

namespace App\Http\Resources;

use App\Service\UploadService;
use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class PeriodResource extends JsonResource
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
            'start'=>($this->start)?Carbon::parse($this->start)->format('Y-m-d'):null,
            'end'=>($this->end)?Carbon::parse($this->end)->format('Y-m-d'):null,
        ];
    }
}
