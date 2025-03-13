<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Notification;
use Tymon\JWTAuth\Facades\JWTAuth;

   class NotificationController extends Controller
{
    public function show($id)
    {
            // Retrieve notifications for the user
            $notifications = Notification::where('receiver_id', $id)->get();

            if (!$notifications) {
                return response()->json(['message' => 'No notifications found'], 404);
            }
    
            // Return notifications for the authenticated user
            return response()->json($notifications);
    }
}
    

