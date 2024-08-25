<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AvailableTime extends Model
{
    use HasFactory;

    protected $fillable = [
        'vet_id',
        'day',
        'start_time',
        'end_time',
    ];

    public function vet()
    {
        return $this->belongsTo(Vet::class);
    }
}
