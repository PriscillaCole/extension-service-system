<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Mail;
use App\Mail\FarmerCredentialsMail;

class Farmer extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'profile_picture',
        'surname',
        'given_name',
        'gender',
        'date_of_birth',
        'nin',
        'marital_status',
        'primary_phone_number',
        'secondary_phone_number',
        'physical_address',
        'cooperative_association',
        'is_land_owner',
        'production_scale',
        'access_to_credit',
        'farming_experience',
        'education',
        'status',
        'user_id',
        'added_by',
        'email'

    ];

    //relationship between the farmer and a farm
    public function farms()
    {
        return $this->hasMany(Farm::class, 'owner_id');
    }

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            
                //check if the user with the same primary_phone_number exists
                $user = User::where('email', $model->primary_phone_number) 
                ->orWhere('username', $model->primary_phone_number)
                ->first();
            
                if(!$user){
                   //create a new user and assign the user_id to the vet
                    $new_user = new User();
                    $new_user->username = $model->email;
                    $new_user->name = $model->surname.' '.$model->given_name;
                    $new_user->email = $model->email ?? $model->primary_phone_number . '@example.com';
                    $new_user->password = bcrypt('password');
                    $new_user->avatar = $model->profile_picture ? $model->profile_picture : 'images/default_image.png';
                    $new_user->save();

                    error_log('here');
                    $model->user_id = $new_user->id;

                    $credentials = [
                        'email' => $new_user->email,
                        'password' => 'password'
                    ];

                     // Send the credentials via email
                Mail::to($new_user->email)->send(new FarmerCredentialsMail($credentials, $new_user));
                }
               
               
           
        });

          //call back to send a notification to the user
          self::created(function ($model) 
          {
               

                Notification::update_notification($model, 'Farmer', request()->segment(count(request()->segments())));

                $new_user = User::where('email', $model->primary_phone_number)
                ->orWhere('username', $model->primary_phone_number)
                ->first();
               
                if ($new_user) {
                    // Check if the user already has the role with role_id = 3
                    $existing_role = AdminRoleUser::where('user_id', $new_user->id)
                                                  ->where('role_id', 3)
                                                  ->first();
                
                    // Only assign the role if the user doesn't already have it
                    if (!$existing_role) {
                        $new_role = new AdminRoleUser();
                        $new_role->role_id = 3;
                        $new_role->user_id = $new_user->id;
                        $new_role->save();
                    }
                }

          });


        
           self::updating(function ($model){
               
            });
           

            //call back to send a notification to the user
            self::updated(function ($model) 
            {
                Notification::update_notification($model, 'Farmer', request()->segment(count(request()->segments())-1));

                
 
            });

    
         
        

    }
}
 