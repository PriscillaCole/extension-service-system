<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Utils extends Model
{
    use HasFactory;

    public static function apiSuccess($data = null, $message = 'Success')
    {
        header('Content-Type: application/json');

        die(json_encode([
            'code' => 1,
            'message' => $message,
            'data' => $data
        ]));
    }

    public static function apiError($message = 'Error', $data = null)
    {
        header('Content-Type: application/json');
        die(json_encode([
            'code' => 0,
            'message' => $message,
            'data' => $data
        ]));
    }
    //delete notification after the form has been viewed
    public static function delete_notification($model_name, $id)
    {
       
        $model = "App\\Models\\" .ucfirst($model_name);
        $user =auth('admin')->user();
        $form = $model::findOrFail($id);
        //delete the notification from the database once a user views the form
        if(!$user->inRoles(['administrator','ldf_admin']) )
        {
            
            if($form->status == 'approved'|| $form->status =='halted' || $form->status == 'rejected' )
            {
                
                \App\Models\Notification::where(['receiver_id' => $user->id, 'model_id' => $id, 'model' => $model_name])->delete();
        
            }

        }

      
    }

    //disable action buttons depending on the status of the form
    public static function disable_buttons($model, $grid)
    {
        $user = auth('admin')->user();
        if ($user->inRoles(['administrator','ldf_admin'])) 
        {
                //disable create button and delete
                $grid->actions(function ($actions) {
                    
                if ($actions->row->status == 'approved') {
                    //check if the logged in user id is the same as the user_id in the row added_by
                    if($actions->row->added_by != auth('admin')->user()->id)
                    {
                        $actions->disableDelete();
                    }
                    
                }
               
                });
        }

        if ($user->isRole('basic-user'))
        {
                 
            $grid->actions(function ($actions) 
            {
                if ($actions->row->status == 'halted') {
                    $actions->disableDelete();
                }
                if($actions->row->status == 'rejected' || 
                 $actions->row->status == 'approved')
                {
                    $actions->disableDelete();
                    $actions->disableEdit();
                }
         
            });
                    
                
        }
    
    
    }

    //storing images from the api
    public static function storeBase64Image($base64Image, $directory)
    {
        if ($base64Image) {
            list($type, $imageData) = explode(';', $base64Image);
            list(, $imageData) = explode(',', $imageData);
            $imageData = base64_decode($imageData);

            $filePath = $directory . '/' . uniqid() . '.jpg';
            Storage::disk('admin')->put($filePath, $imageData);

            return $filePath;
        }
        return null;
    }

    //function to delete images and files from the storage
    public static function deleteImage($image)
    {
        if ($image) {
            Storage::disk('public')->delete($image);
        }
    }
}
