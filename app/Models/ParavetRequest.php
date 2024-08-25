<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParavetRequest extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'paravet_id',
        'location',
        'status',
        'description',
        'date',
        'time',
    ];
}
