<?php

namespace App\Http\Controllers;

use Encore\Admin\Auth\Database\Role;
use Tymon\JWTAuth\Facades\JWTAuth;

class UserRoleController extends Controller
{
    
    public function show()
    {
        try {
            // Authenticate the user using JWT
            $user = JWTAuth::parseToken()->authenticate();
    
            if (!$user) {
                return response()->json(['error' => 'user_not_found'], 404);
            }
    
            // Fetch roles for the authenticated user
            $roles = $user->roles()->get();
    
            // Check if the user has the admin role (assuming role ID 1 corresponds to admin)
            if ($roles->isEmpty() || $roles->pluck('id')->first() != 1) {
                return response()->json(['error' => 'You are not authorized to view user roles'], 403);
            }
    
            // Retrieve all user roles
            $user_roles = Role::all();
    
            // Return the user roles
            return response()->json($user_roles);
    
        } catch (\Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['error' => 'token_expired', 'message' => $e->getMessage()], 401);
        } catch (\Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['error' => 'token_invalid', 'message' => $e->getMessage()], 401);
        } catch (\Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['error' => 'token_absent', 'message' => $e->getMessage()], 401);
        }
    }
    
    
}