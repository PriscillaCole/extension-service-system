<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Notification;
use Tymon\JWTAuth\Facades\JWTAuth;

class NotificationController extends Controller
{
    public function show($id)
    {
        try {
            // Authenticate the user using JWT
            $user = JWTAuth::parseToken()->authenticate();
    
            // Check if the user is authenticated
            if (!$user) {
                return response()->json(['error' => 'user_not_found'], 404);
            }
    
            // Retrieve notifications for the user
            $notifications = Notification::where('receiver_id', $user->id)->get();
    
            // Check if the user is trying to access notifications for another user
            if ($user->id != $id) {
                return response()->json(['error' => 'You can only view your notifications.'], 403);
            }
    
            // Return notifications for the authenticated user
            return response()->json($notifications);
    
        } catch (\Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['error' => 'token_expired', 'message' => $e->getMessage()], 401);
        } catch (\Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['error' => 'token_invalid', 'message' => $e->getMessage()], 401);
        } catch (\Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['error' => 'token_absent', 'message' => $e->getMessage()], 401);
        }
    }
    
}
