<?php

namespace App\Models;

use App\Traits\UUID;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Identifier extends Model
{
    use HasFactory;
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */

    use UUID;

    protected $primaryKey = 'value';

    protected $fillable = [
        'use',
        'type',
        'system',
        'value',
        'period',
        'assigner',
    ];
    public $timestamps = false;

    /**
     * Get the user that owns the comment.
     */
    public function periodRelation()
    {
        return $this->hasOne(Period::class, 'id', 'period');
    }

}
