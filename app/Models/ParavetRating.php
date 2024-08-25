<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParavetRating extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 
        'paravet_id',
        'rating',
        'comment',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function paravet()
    {
        return $this->belongsTo(Vet::class);
    }
}
