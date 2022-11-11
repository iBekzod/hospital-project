<?php

namespace App\Models;

use App\Traits\UUID;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Period extends Model
{
    use HasFactory;
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */

    use UUID;

    protected $primaryKey = 'id';

    protected $fillable = [
        'start',
        'end'
    ];

    /**
     * Get the user that owns the comment.
     */
    public function periodRelation()
    {
        return $this->hasOne(Period::class);
    }

}
