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

    //call back function to send notification to the paravet when a request is made
    protected static function boot()
    {
        parent::boot();
        static::creating(function ($model) {
            Notification::send_request_notification($model, 'ParavetRequest', request()->segment(count(request()->segments())));
        });

        //call back function to send notification to the user when a request is accepted
        static::updating(function ($model) {
       
            Notification::update_notification($model, 'ParavetRequest', request()->segment(count(request()->segments())-1));
          
        });
    }
}
