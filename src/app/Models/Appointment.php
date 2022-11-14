<?php

namespace App\Models;

use App\Traits\UUID;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Appointment extends Model
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
        'identifier',
        'status',
        'participant',
        'performer',
    ];
    public $timestamps = false;

    /**
     * Get the user that owns the comment.
     */
    public function identifierRelation()
    {
        return $this->hasOne(Identifier::class, 'value', 'identifier');
    }

}
