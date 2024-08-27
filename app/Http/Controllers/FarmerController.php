<?php

namespace App\Http\Controllers;


use App\Models\Farmer;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use App\Models\Utils;
use App\Models\User;

class FarmerController extends Controller
{
    public function index()
    {
        return Farmer::all();
    }

    public function show($id)
    {
        $farmer = Farmer::find($id);
        return response()->json($farmer);
    }

    public function store(Request $request)
    {
    
        // Define validation rules
        $rules = [
            'surname' => 'required|string',
            'given_name' => 'required|string',
            'date_of_birth' => 'required|date|before_or_equal:today',
            'nin' => 'required|string',
            'physical_address' => 'nullable|string',
            'gender' => 'required|in:M,F',
            'marital_status' => 'nullable|in:S,M,D,W',
            'cooperative_association' => 'nullable|string',
            'primary_phone_number' => 'required|string|unique:farmers,primary_phone_number',
            'secondary_phone_number' => 'nullable|string',
            'is_land_owner' => 'nullable|boolean',
            'production_scale' => 'required|string',
            'access_to_credit' => 'nullable|boolean',
            'farming_experience' => 'required|date_format:Y',
            'education' => 'nullable|string',
            'profile_picture' => 'nullable|string',
            
        ];
    
        try {
            // Validate the incoming request data
            $validatedData = Validator::make($request->all(), $rules)->validate();
        } catch (ValidationException $e) {
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $e->errors()
            ], 422);
        }

    
        // For example, handle profile_picture if present
        if ($request->has('profile_picture')) {
            $validatedData['profile_picture'] = Utils::storeBase64Image($request->input('profile_picture'), 'images');
        }

        $user = User::where('email', $validatedData['primary_phone_number']) 
        ->orWhere('username', $validatedData['primary_phone_number'])
        ->first();

        if($user){
            return response()->json([
                'message' => 'User with the same primary phone number already exists'
            ], 422);
        }
    
        // Save the validated data to the database
        // Example assuming you have a Farmer model
        $farmer = Farmer::create($validatedData);
    
        return response()->json([
            'message' => 'Farmer added successfully',
            'farmer' => $farmer
        ], 201);
    }

    public function update(Request $request, $id)
    {

          // Define validation rules
          $rules = [
            'surname' => 'required|string',
            'given_name' => 'required|string',
            'date_of_birth' => 'required|date|before_or_equal:today',
            'nin' => 'required|string',
            'physical_address' => 'nullable|string',
            'gender' => 'required|in:M,F',
            'marital_status' => 'nullable|in:S,M,D,W',
            'cooperative_association' => 'nullable|string',
            'primary_phone_number' => 'required|string|unique:farmers,primary_phone_number',
            'secondary_phone_number' => 'nullable|string',
            'is_land_owner' => 'nullable|boolean',
            'production_scale' => 'required|string',
            'access_to_credit' => 'nullable|boolean',
            'farming_experience' => 'required|date_format:Y',
            'education' => 'nullable|string',
            'profile_picture' => 'nullable|string',
            
        ];
    
    
        try {
            // Validate the incoming request data
            $validatedData = Validator::make($request->all(), $rules)->validate();
        } catch (ValidationException $e) {
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $e->errors()
            ], 422);
        }
    
        $user = User::where('email', $validatedData['primary_phone_number']) 
        ->orWhere('username', $validatedData['primary_phone_number'])
        ->first();

        if($user){
            return response()->json([
                'message' => 'User with the same primary phone number already exists'
            ], 422);
        }
    
        // handle profile_picture if present
        if ($request->has('profile_picture')) {
            $validatedData['profile_picture'] = Utils::storeBase64Image($request->input('profile_picture'), 'images');
        }

        $farmer = Farmer::findOrFail($id);
        $farmer->update($validatedData);
        return response()->json([
            'message' => 'Farmer updated successfully',
            'farmer' => $farmer
        ], 200);
    }

    public function destroy($id)
    {
        $farmer = Farmer::findOrFail($id);

        //delete all farms associated with the farmer
        $farmer->farms()->delete();

        //delete all files and images associated with the farmer
        if($farmer->profile_picture) {
            Utils::deleteImage($farmer->profile_picture);
        }

        $farmer->delete();

        return response()->json([
            'message' => 'Farmer deleted successfully'
        ], 200);
    }
}
