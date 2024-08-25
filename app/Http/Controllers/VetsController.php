<?php

namespace App\Http\Controllers;

use App\Models\Utils;
use App\Models\Vet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

class VetsController extends Controller
{
    public function index()
    {
        // Get all vets with available times
        $vets = Vet::with('availableTimes')->get();

        return response()->json([
            'vets' => $vets
        ], 200);
    }

    public function show($id)
    {
        $vet = Vet::with('availableTimes')->findOrFail($id);
        return response()->json($vet);
    }

    public function store(Request $request)
    {
        // Validation rules
        $rules = [
            'title' => 'required|string',
            'category' => 'required|string',
            'surname' => 'required|string',
            'given_name' => 'required|string',
            'date_of_birth' => 'required|date',
            'gender' => 'required|string',
            'education' => 'required|string',
            'marital_status' => 'required|string',
            'group_or_practice' => 'required|string',
            'registration_number' => 'required|string',
            'registration_date' => 'required|date',
            'brief_profile' => 'nullable|string',
            'physical_address' => 'required|string',
            'primary_phone_number' => 'required|string|max:15|unique:vets,primary_phone_number',
            'secondary_phone_number' => 'nullable|string|max:15',
            'email' => 'required|email|unique:vets,email',
            'postal_address' => 'nullable|string|max:255',
            'services_offered' => 'required|string',
            'areas_of_operation' => 'required|string',
            'certificate_of_registration' => 'required|string',
            'license' => 'required|string',
            'other_documents' => 'nullable|array',
            'other_documents.*' => 'string',
            'profile_picture' => 'nullable|string',
            'available_times' => 'required|array',
            'available_times.*.day' => 'required|string',
            'available_times.*.start_time' => 'required|date_format:H:i',
            'available_times.*.end_time' => 'required|date_format:H:i',
        ];
    
        // Validate the incoming request data
        try {
            $validatedData = Validator::make($request->all(), $rules)->validate();
        } catch (ValidationException $e) {
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $e->errors()
            ], 422);
        }
    
        // Handle base64 file uploads
        if ($request->has('certificate_of_registration')) {
            $validatedData['certificate_of_registration'] = Utils::storeBase64Image($request->input('certificate_of_registration'), 'files');
        }
    
        if ($request->has('license')) {
            $validatedData['license'] = Utils::storeBase64Image($request->input('license'), 'files');
        }
    
        if ($request->has('other_documents')) {
            $other_documents = [];
            foreach ($request->input('other_documents') as $document) {
                $other_documents[] = Utils::storeBase64Image($document, 'files');
            }
            $validatedData['other_documents'] = json_encode($other_documents);
        }
    
        if ($request->has('profile_picture')) {
            $validatedData['profile_picture'] = Utils::storeBase64Image($request->input('profile_picture'), 'images');
        }
    
        // Save the validated data to the database
        $vet = Vet::create($validatedData);

            // Save available times
        if ($request->has('available_times')) {
            foreach ($request->input('available_times') as $time) {
                $vet->availableTimes()->create($time);
            }
        }

          // Load the available times relationship
         $vet->load('availableTimes');
    
        return response()->json([
            'message' => 'Vet added successfully',
            'vet' => $vet
        ], 201);
    }

    public function update(Request $request, $id)
    {
       // Validation rules
       $rules = [
        'title' => 'required|string',
        'category' => 'required|string',
        'surname' => 'required|string',
        'given_name' => 'required|string',
        'date_of_birth' => 'required|date',
        'gender' => 'required|string',
        'education' => 'required|string',
        'marital_status' => 'required|string',
        'group_or_practice' => 'required|string',
        'registration_number' => 'required|string',
        'registration_date' => 'required|date',
        'brief_profile' => 'nullable|string',
        'physical_address' => 'required|string',
        'primary_phone_number' => 'required|string|max:15',
        'secondary_phone_number' => 'nullable|string|max:15',
        'email' => 'required|email|unique:vets,email',
        'postal_address' => 'nullable|string|max:255',
        'services_offered' => 'required|string',
        'areas_of_operation' => 'required|string',
        'certificate_of_registration' => 'required|string',
        'license' => 'required|string',
        'other_documents' => 'nullable|array',
        'other_documents.*' => 'string',
        'profile_picture' => 'nullable|string',
        'available_times' => 'required|array',
        'available_times.*.id' => 'nullable|integer',
        'available_times.*.day' => 'required|string',
        'available_times.*.start_time' => 'required|date_format:H:i',
        'available_times.*.end_time' => 'required|date_format:H:i',
        ];

        // Validate the incoming request data
        try {
            $validatedData = Validator::make($request->all(), $rules)->validate();
        } catch (ValidationException $e) {
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $e->errors()
            ], 422);
        }


        // Find the vet by ID
        $vet = Vet::findOrFail($id);


        // Handle base64 file uploads
        if ($request->has('certificate_of_registration')) {
            $validatedData['certificate_of_registration'] =  Utils::storeBase64Image($request->input('certificate_of_registration'), 'files');
        }

        if ($request->has('license')) {
            $validatedData['license'] = Utils::storeBase64Image($request->input('license'), 'files');
        }

        if ($request->has('other_documents')) {
            $other_documents = [];
            foreach ($request->input('other_documents') as $document) {
                $other_documents[] = Utils::storeBase64Image($document, 'files');
            }
            $validatedData['other_documents'] = json_encode($other_documents);
        }

        if ($request->has('profile_picture')) {
            $validatedData['profile_picture'] = Utils::storeBase64Image($request->input('profile_picture'), 'images');
        }

        // Update the vet with the validated data
        $vet->update($validatedData);

        // Update available times
        $vet->availableTimes()->delete(); // Delete existing times
        foreach ($request->input('available_times') as $time) {
            $vet->availableTimes()->create($time); // Create new times
        }

        // Load the available times relationship
        $vet->load('availableTimes');

            return response()->json([
                'message' => 'Vet updated successfully',
                'vet' => $vet
            ], 200);
            
    }

    public function destroy($id)
    {
        // Find the vet by ID
        $vet = Vet::findOrFail($id);

        //delete all iamges and files associated with the vet
        // Array of properties to check and delete if they exist
        $propertiesToCheck = [
            'certificate_of_registration',
            'license',
            'other_documents',
            'profile_picture'
        ];

        foreach ($propertiesToCheck as $property) {
            if ($vet->$property) {
                // If the property is 'other_documents', handle it as a JSON array
                if ($property === 'other_documents') {
                    $other_documents = json_decode($vet->other_documents);
                    foreach ($other_documents as $document) {
                        Utils::deleteImage($document);
                    }
                } else {
                    Utils::deleteImage($vet->$property);
                }
            }
        }

         // Delete associated available times
         $vet->availableTimes()->delete();
        
        // Delete the vet
        $vet->delete();

        return response()->json(['message' => 'Vet deleted successfully']);
    }

}
