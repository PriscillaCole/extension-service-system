<?php

namespace App\Http\Controllers;

use App\Models\HealthRecord;
use App\Models\Farmer;
use App\Models\Farm;
use App\Models\FarmAnimal;
use App\Models\Vet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

class HealthRecordController extends Controller
{
    public function index()
    {
        $healthRecords = HealthRecord::all();
        $healthRecord= [];
        //for each get the farm object, paravet object and animal object
        foreach ($healthRecords as $record) {
            $farm = Farm::find($record->farm_id);
            $paravet = Vet::find($record->paravet_id);
            $animal = FarmAnimal::find($record->animal_id);
            $healthRecord[] = [
                'health_record' => $record,
                'farm' => $farm,
                'paravet' => $paravet,
                'animal' => $animal
            ];
        }

        return response()->json($healthRecord);
    
    }

    public function show($id)
    {
        $healthRecord = HealthRecord::find($id);
        if ($healthRecord) {
            $farm = Farm::find($healthRecord->farm_id);
            $paravet = Vet::find($healthRecord->paravet_id);
            $animal = FarmAnimal::find($healthRecord->animal_id);
            $healthRecord = [
                'health_record' => $healthRecord,
                'farm' => $farm,
                'paravet' => $paravet,
                'animal' => $animal
            ];
            return response()->json($healthRecord);
        } else {
            return response()->json(['message' => 'HealthRecord not found'], 404);
        }
    }

    public function store(Request $request)
    {
        $rules = [
           
            'farm_id' => 'required|exists:farms,id',
            'animal_id' => 'required|exists:farm_animals,id',
            'paravet_id' => 'required|exists:vets,id',
            'visit_date' => 'nullable|date',
            'weight' => 'nullable|numeric',
            'body_temperature' => 'nullable|numeric',
            'heart_rate' => 'nullable|integer',
            'respiratory_rate' => 'nullable|integer',
            'body_condition_score' => 'nullable|numeric',
            'skin_condition' => 'nullable|string',
            'mucous_membranes' => 'nullable|string',
            'hoof_condition' => 'nullable|string',
            'appetite' => 'nullable|string',
            'behavior' => 'nullable|string',
            'gait_posture' => 'nullable|string',
            'signs_of_pain' => 'nullable|string',
            'fecal_exam_results' => 'nullable|string',
            'blood_test_results' => 'nullable|string',
            'urine_test_results' => 'nullable|string',
            'medications' => 'nullable|string',
            'vaccinations' => 'nullable|string',
            'procedures' => 'nullable|string',
            'follow_up_actions' => 'nullable|string',
            'overall_health_status' => 'nullable|string',
            'environmental_factors' => 'nullable|string',
            'notes' => 'nullable|string',
        ];

        try {
            $validatedData = Validator::make($request->all(), $rules)->validate();
        } catch (ValidationException $e) {
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $e->errors()
            ], 422);
        }

        $healthRecord = HealthRecord::create($validatedData);

        return response()->json([
            'message' => 'HealthRecord added successfully',
            'healthRecord' => $healthRecord
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $rules = [
            'farm_id' => 'required|exists:farms,id',
            'animal_id' => 'required|exists:farm_animals,id',
            'paravet_id' => 'required|exists:vets,id',
            'visit_date' => 'nullable|date',
            'weight' => 'nullable|numeric',
            'body_temperature' => 'nullable|numeric',
            'heart_rate' => 'nullable|integer',
            'respiratory_rate' => 'nullable|integer',
            'body_condition_score' => 'nullable|numeric',
            'skin_condition' => 'nullable|string',
            'mucous_membranes' => 'nullable|string',
            'hoof_condition' => 'nullable|string',
            'appetite' => 'nullable|string',
            'behavior' => 'nullable|string',
            'gait_posture' => 'nullable|string',
            'signs_of_pain' => 'nullable|string',
            'fecal_exam_results' => 'nullable|string',
            'blood_test_results' => 'nullable|string',
            'urine_test_results' => 'nullable|string',
            'medications' => 'nullable|string',
            'vaccinations' => 'nullable|string',
            'procedures' => 'nullable|string',
            'follow_up_actions' => 'nullable|string',
            'overall_health_status' => 'nullable|string',
            'environmental_factors' => 'nullable|string',
            'notes' => 'nullable|string',
        ];

        try {
            $validatedData = Validator::make($request->all(), $rules)->validate();
        } catch (ValidationException $e) {
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $e->errors()
            ], 422);
        }

        $healthRecord = HealthRecord::find($id);
        if ($healthRecord) {
            $healthRecord->update($validatedData);
            return response()->json([
                'message' => 'HealthRecord updated successfully',
                'healthRecord' => $healthRecord
            ], 200);
        } else {
            return response()->json(['message' => 'HealthRecord not found'], 404);
        }
    }

    public function destroy($id)
    {
        $healthRecord = HealthRecord::find($id);
        if ($healthRecord) {
            $healthRecord->delete();
            return response()->json(['message' => 'HealthRecord deleted successfully'], 200);
        } else {
            return response()->json(['message' => 'HealthRecord not found'], 404);
        }
    }
    
   public function showHealthRecordsByAnimal($animalId)
    {
        $healthRecords  = HealthRecord::where('animal_id', $animalId)->get();

        $healthRecord= [];
        //for each get the farm object, paravet object and animal object
        foreach ($healthRecords as $record) {
            $farm = Farm::find($record->farm_id);
            $paravet = Vet::find($record->paravet_id);
            $animal = FarmAnimal::find($record->animal_id);
            $healthRecord[] = [
                'health_record' => $record,
                'farm' => $farm,
                'paravet' => $paravet,
                'animal' => $animal
            ];
        }

        return response()->json($healthRecord);
    }

    public function showHealthRecordsByFarm($farmId)
    {
       
        $healthRecords = HealthRecord::where('farm_id', $farmId)->get();
        $healthRecord= [];
        //for each get the farm object, paravet object and animal object
        foreach ($healthRecords as $record) {
            $farm = Farm::find($record->farm_id);
            $paravet = Vet::find($record->paravet_id);
            $animal = FarmAnimal::find($record->animal_id);
            $healthRecord[] = [
                'health_record' => $record,
                'farm' => $farm,
                'paravet' => $paravet,
                'animal' => $animal
            ];
        }

        return response()->json($healthRecord);
    }

    public function showHealthRecordsByVet($paravetId)
    {
       
        $healthRecords = HealthRecord::where('paravet_id', $paravetId)->get();
        $healthRecord= [];
        //for each get the farm object, paravet object and animal object
        foreach ($healthRecords as $record) {
            $farm = Farm::find($record->farm_id);
            $paravet = Vet::find($record->paravet_id);
            $animal = FarmAnimal::find($record->animal_id);
            $healthRecord[] = [
                'health_record' => $record,
                'farm' => $farm,
                'paravet' => $paravet,
                'animal' => $animal
            ];
        }

        return response()->json($healthRecord);
    }

    public function showHealthRecordsByDate($date)
    {
       
        $healthRecords = HealthRecord::where('visit_date', $date)->get();
        $healthRecord= [];
        //for each get the farm object, paravet object and animal object
        foreach ($healthRecords as $record) {
            $farm = Farm::find($record->farm_id);
            $paravet = Vet::find($record->paravet_id);
            $animal = FarmAnimal::find($record->animal_id);
            $healthRecord[] = [
                'health_record' => $record,
                'farm' => $farm,
                'paravet' => $paravet,
                'animal' => $animal
            ];
        }

        return response()->json($healthRecord);
    }
}
