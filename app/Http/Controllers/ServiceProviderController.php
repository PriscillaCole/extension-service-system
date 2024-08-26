<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ServiceProvider;
use App\Models\Utils;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

class ServiceProviderController extends Controller
{
    public function index()
    {
        return ServiceProvider::all();
    }

    public function show($id)
    {
        $serviceProvider = ServiceProvider::find($id);
        return response()->json($serviceProvider);
    }

    public function store(Request $request)
    {
         // Define validation rules
    $rules = [
        'provider_category' => 'required|string',
        'provider_type' => 'required|string',
        'name' => 'required|string|max:255',
        'owner_name' => 'required|string|max:255',
        'owner_profile' => 'required|string',
        'ursb_incorporation_number' => 'required|string|max:255',
        'date_of_incorporation' => 'required|date|before_or_equal:today',
        'type_of_shop' => 'required|string',
        'date_of_registration' => 'required|date|before_or_equal:today',
        'physical_address' => 'required|string|max:255',
        'primary_phone_number' => 'required|string|max:15',
        'secondary_phone_number' => 'nullable|string|max:15',
        'email' => 'nullable|email|max:255|unique:service_providers',
        'postal_address' => 'nullable|string|max:255',
        'other_services' => 'nullable|string',
        'logo' => 'nullable|string', // Accepting base64 string
        'district_of_operation' => 'required|string|max:255',
        'tin_number_business' => 'required|string|max:255',
        'tin_number_owner' => 'nullable|string|max:255',
        'NDA_registration_number' => 'required|string', // Accepting base64 string
        'license' => 'required|string', // Accepting base64 string
        'other_documents' => 'nullable|array',
        'other_documents.*' => 'string', // Accepting base64 strings
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

        // Handle base64 file uploads
        $validatedData['logo'] = Utils::storeBase64Image($request->input('logo'), 'images');
        $validatedData['NDA_registration_number'] = Utils::storeBase64Image($request->input('NDA_registration_number'), 'files');
        $validatedData['license'] = Utils::storeBase64Image($request->input('license'), 'files');

        if ($request->has('other_documents')) {
            $other_documents = [];
            foreach ($request->input('other_documents') as $document) {
                $other_documents[] = Utils::storeBase64Image($document, 'files');
            }
            $validatedData['other_documents'] = json_encode($other_documents);
        }

        // Save the validated data to the database
        $serviceProvider = ServiceProvider::create($validatedData);
        return response()->json([
            'message' => 'Service provider created successfully.',
            'data' => $serviceProvider
        ], 201);
        
    }

    public function update(Request $request, $id)
    {
        // Validate the incoming request data
        // Define validation rules
    $rules = [
        'provider_category' => 'required|string',
        'provider_type' => 'required|string',
        'name' => 'required|string|max:255',
        'owner_name' => 'required|string|max:255',
        'owner_profile' => 'required|string',
        'ursb_incorporation_number' => 'required|string|max:255',
        'date_of_incorporation' => 'required|date|before_or_equal:today',
        'type_of_shop' => 'required|string',
        'date_of_registration' => 'required|date|before_or_equal:today',
        'physical_address' => 'required|string|max:255',
        'primary_phone_number' => 'required|string|max:15',
        'secondary_phone_number' => 'nullable|string|max:15',
        'email' => 'nullable|email|max:255|unique:service_providers,email',
        'postal_address' => 'nullable|string|max:255',
        'other_services' => 'nullable|string',
        'logo' => 'nullable|string', // Accepting base64 string
        'district_of_operation' => 'required|string|max:255',
        'tin_number_business' => 'required|string|max:255',
        'tin_number_owner' => 'nullable|string|max:255',
        'NDA_registration_number' => 'required|string', // Accepting base64 string
        'license' => 'required|string', // Accepting base64 string
        'other_documents' => 'nullable|array',
        'other_documents.*' => 'string', // Accepting base64 strings
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
        // Find the service provider by ID
        $serviceProvider = ServiceProvider::findOrFail($id);
    
        // Handle base64 file uploads
        if ($request->has('logo')) {
            $validatedData['logo'] = Utils::storeBase64Image($request->input('logo'), 'images');
        }
    
        if ($request->has('NDA_registration_number')) {
            $validatedData['NDA_registration_number'] = Utils::storeBase64Image($request->input('NDA_registration_number'), 'files');
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
    
        // Update the service provider with the validated data
        $serviceProvider->update($validatedData);
    
        return response()->json($serviceProvider);
    }
    

    public function destroy($id)
    {
        // Find the service provider by ID
        $serviceProvider = ServiceProvider::findOrFail($id);

        //delete all iamges and files associated with the service provider
        // Array of properties to check and delete if they exist
        $propertiesToCheck = [
            'logo',
            'NDA_registration_number',
            'license',
            'other_documents'
        ];

        foreach ($propertiesToCheck as $property) {
            if ($serviceProvider->$property) {
                // If the property is 'other_documents', handle it as a JSON array
                if ($property === 'other_documents') {
                    $documents = json_decode($serviceProvider->$property);
                    foreach ($documents as $document) {
                        Utils::deleteImage($document);
                    }
                } else {
                    Utils::deleteImage($serviceProvider->$property);
                }
            }
        }
        
        // Delete the service provider
        $serviceProvider->delete();

        return response()->json(['message' => 'Service provider deleted successfully']);
    }


    /**
     * Store a base64 encoded image.
     *
     * @param  string $base64Image
     * @param  string $directory
     * @return string|null
     */
  
}
