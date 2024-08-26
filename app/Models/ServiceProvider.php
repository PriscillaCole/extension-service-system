<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ServiceProvider extends Model
{
    use HasFactory;
    use SoftDeletes;
    
    protected $fillable=[
        'provider_category',
        'provider_type',
        'name',
        'owner_name',
        'owner_profile',
        'ursb_incorporation_number',
        'date_of_incorporation',
        'type_of_shop',
        'date_of_registration',
        'physical_address',
        'primary_phone_number',
        'secondary_phone_number',
        'email',
        'postal_address',
        'other_services',
        'logo',
        'district_of_operation',
        'NDA_registration_number',
        'tin_number_business',
        'tin_number_owner',
        'license',
        'other_documents',
        'status',
        'user_id',
        'added_by'


    ];

    protected static function boot()
    {
        parent::boot();
        static::creating(function ($model) {
            // Check if it's the admin creating the form or LDF
            $user = auth('admin')->user();
            
            if (!$user) {
                return;  // Exit early if no user
            }
        
            if ($user->inRoles(['administrator', 'ldf_admin'])) {
                // Check if the user with the same email exists
                $existingUser = User::where('email', $model->email)
                    ->orWhere('username', $model->email)
                    ->first();
                
                if (!$existingUser) {
                    // Create a new user and assign the user_id to the vet
                    $new_user = new User();
                    $new_user->username = $model->email;
                    $new_user->name = $model->surname . ' ' . $model->given_name;
                    $new_user->email = $model->email;
                    $new_user->password = bcrypt('password');
                    $new_user->avatar = $model->profile_picture ? $model->profile_picture : 'images/default_image.png';
                    $new_user->save();
        
                    $model->user_id = $new_user->id;
                }
            }
        });
        

          //call back to send a notification to the user
          self::created(function ($model) 
          {
            

                $user = auth('admin')->user();
            
                if (!$user) {
                    return;  // Exit early if no user
                }

                if($user->inRoles(['administrator','ldf_admin']))
                {
                    $new_user = User::where('email', $model->email)
                    ->orWhere('username', $model->email)
                    ->first();
                    $new_role = new AdminRoleUser();
                    $new_role->role_id = 3;
                    $new_role->user_id = $new_user->id;
                    $new_role->save();
                }

          });


           //callback to create a user with the vet credentials after if the status is approved 
           self::updating(function ($model){

                if($model->status == 'approved'){
                    $user = User::where('email', $model->email) 
                    ->orWhere('username', $model->email)
                    ->first();
                    if(!$user){
                       //create a new user and assign the user_id to the vet
                        $new_user = new User();
                        $new_user->username = $model->email;
                        $new_user->name = $model->surname.' '.$model->given_name;
                        $new_user->email = $model->email;
                        $new_user->password = bcrypt('password');
                        $new_user->avatar = $model->profile_picture ? $model->profile_picture : 'images/default_image.png';
                        $new_user->save();
    
                        
                        $model->user_id = $new_user->id;
                    }
                }

            });
           

            //call back to send a notification to the user
            self::updated(function ($model) 
            {
                $user = $model->user_id;
                 if(!$user){
                    return;
                 }

                 else{
                    Notification::update_notification($model, 'ServiceProvider', request()->segment(count(request()->segments())-1));

                    $new_user = User::where('email', $model->email)
                    ->orWhere('username', $model->email)
                    ->first();
                    $new_role = new AdminRoleUser();
                    $new_role->role_id = 3;
                    $new_role->user_id = $new_user->id;
                    $new_role->save();
                 }
 
            });

    
         
        

    }
}