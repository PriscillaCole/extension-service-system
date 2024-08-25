<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class FarmAnimal extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'farm_id',
        'type',
        'tag_number',
        'species',
        'gender',
        'date_of_birth',
        'color',
        'current_location',
        'weight',
        'body_condition_score',
        'health_history',
        'medications',
        'vaccinations',
        'dietary_requirements',
        'parentage',
        'behavioral_notes',
        'handling_requirements',
        'management_notes',
        'feeding_schedule',
      
    ];

    protected $casts = [
        'date_of_birth' => 'date',
        'weight' => 'float',
       
    ];

    public function farm()
    {
        return $this->belongsTo(Farm::class);
    }
}