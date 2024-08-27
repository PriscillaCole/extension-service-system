<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class HealthRecord extends Model
{
    use HasFactory;

    use SoftDeletes;

    protected $fillable = [
        'farm_id',
        'animal_id',
        'paravet_id',
        'visit_date',
        'weight',
        'body_temperature',
        'heart_rate',
        'respiratory_rate',
        'body_condition_score',
        'skin_condition',
        'mucous_membranes',
        'hoof_condition',
        'appetite',
        'behavior',
        'gait_posture',
        'signs_of_pain',
        'fecal_exam_results',
        'blood_test_results',
        'urine_test_results',
        'medications',
        'vaccinations',
        'procedures',
        'follow_up_actions',
        'overall_health_status',
        'environmental_factors',
        'notes'
    ];

    public function animal()
    {
        return $this->belongsTo(FarmAnimal::class);
    }

    public function paravet()
    {
        return $this->belongsTo(Vet::class);
    }
}
