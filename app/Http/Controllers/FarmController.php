<?php

namespace App\Http\Controllers;

use App\Models\Farm;
use App\Models\Farmer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use App\Models\Utils;

class FarmController extends Controller
{
 public function index()
{
    $farms = Farm::all();

    // Initialize an empty array to store farm details
    $farmDetails = [];

    // For each farm, get the owner details and added by details
    foreach ($farms as $farm) {
        $farmer = Farmer::find($farm->owner_id);
        $added_by = Farmer::find($farm->added_by);

        $farmDetails[] = [
            'farm' => $farm,
            'farmer' => $farmer,
            'added_by' => $added_by,
        ];
    }

    return response()->json($farmDetails);
}



   public function show($id)
    {
        $farm = Farm::find($id);
        
        if ($farm) {
            $farmer = Farmer::find($farm->owner_id);
            $added_by = Farmer::find($farm->added_by);
            $farm = [
                'farm' => $farm,
                'farmer' => $farmer,
                'added_by' => $added_by
            ];
            return response()->json($farm);
        } else {
            return response()->json([
                'message' => 'Farm not found'
            ], 404);
        }
    }
   
    public function showFarmerFarms($id)
    {
        $farms = Farm::where('owner_id', $id)->get();

        if ($farms->isEmpty()) {
            return response()->json([
                'message' => 'No farms found for this farmer'
            ], 404);
        }
        
        
        //for each farm, get the owner details and added by details
        $farmerFarms = [];
        foreach ($farms as $farm) {
            $farmer = Farmer::find($farm->owner_id);
            $added_by = Farmer::find($farm->added_by);
            $farmerFarms[] = [
                'farm' => $farm,
                'farmer' => $farmer,
                'added_by' => $added_by
            ];
        }

        return response()->json($farmerFarms);
    }
   
   
    public function store(Request $request)
    {
        $rules= [
            'owner_id' => 'required|exists:farmers,id',
            'name' => 'required|string|max:255',
            'coordinates' => 'required|string|max:255',
            'livestock_type' => 'nullable|array',
            'livestock_type.*' => 'string|max:255',
            'farm_structures' => 'nullable|array',
            'farm_structures.*' => 'string|max:255',
            'production_type' => 'required|array',
            'production_type.*' => 'string|max:255',
            'date_of_establishment' => 'required|date',
            'size' => 'required|string|max:255',
            'number_of_animals' => 'nullable|integer',
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

        // Convert array fields to JSON for storage
        $validatedData['livestock_type'] = $request->input('livestock_type') ? json_encode($request->input('livestock_type')) : null;
        $validatedData['farm_structures'] = $request->input('farm_structures') ? json_encode($request->input('farm_structures')) : null;
        $validatedData['production_type'] = $request->input('production_type') ? json_encode($request->input('production_type')) : null;

        $farm = Farm::create($validatedData);

        return response()->json([
            'message' => 'Farm added successfully',
            'farm' => $farm
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $rules = [
            'owner_id' => 'required|exists:farmers,id',
            'name' => 'required|string|max:255',
            'coordinates' => 'required|string|max:255',
            'livestock_type' => 'nullable|array',
            'livestock_type.*' => 'string|max:255',
            'farm_structures' => 'nullable|array',
            'farm_structures.*' => 'string|max:255',
            'production_type' => 'required|array',
            'production_type.*' => 'string|max:255',
            'date_of_establishment' => 'required|date',
            'size' => 'required|string|max:255',
            'number_of_animals' => 'nullable|integer',
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
    
        // Find the existing farm record
        $farm = Farm::findOrFail($id);
    
        // For example, handle profile_picture if present
        if ($request->has('profile_picture')) {
            $validatedData['profile_picture'] = Utils::storeBase64Image($request->input('profile_picture'), 'images');
        }
    
        // Convert array fields to JSON for storage
        $validatedData['livestock_type'] = $request->input('livestock_type') ? json_encode($request->input('livestock_type')) : null;
        $validatedData['farm_structures'] = $request->input('farm_structures') ? json_encode($request->input('farm_structures')) : null;
        $validatedData['production_type'] = $request->input('production_type') ? json_encode($request->input('production_type')) : null;
    
        // Update the farm record
        $farm->update($validatedData);
    
        return response()->json([
            'message' => 'Farm updated successfully',
            'farm' => $farm
        ], 200);
    }
   
    public function destroy($id)
    {

        $farm = Farm::find($id);
        if ($farm->profile_picture) {
            Utils::deleteImage($farm->profile_picture);
        }

        //delete animals associated with the farm

        $farm->animals()->delete();

        $farm->delete();
        return response()->json([
            'message' => 'Farm deleted successfully'
        ], 200);
    }
}
