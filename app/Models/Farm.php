<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Farm extends Model
{
    use HasFactory;
    use SoftDeletes;
    
    protected $fillable = [
        'name',
        'coordinates',
        'livestock_type',
        'production_type',
        'date_of_establishment',
        'size',
        'profile_picture',
        'number_of_animals',
        'farm_structures',
        'general_remarks',
        'owner_id',
        'added_by'

    ];

    protected $casts = [
        'livestock_type' => 'array',
        'production_type' => 'array',
        'farm_structures' => 'array'
    ];

    public function farmOwner()
    {
        return $this->belongsTo(Farmer::class, 'owner_id');
    }

    //relationship between the farm and the farm animals
    public function animals()
    {
        return $this->hasMany(FarmAnimal::class, 'farm_id');
    }

  
}
