<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ParavetRequest;
use App\Models\User;
use App\Models\Vet;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class ParavetRequestController extends Controller
{
    // Method to fetch available paravets for a given date
    public function availableParavets(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'date' => 'required|date',
           
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $date = Carbon::parse($request->date);
        $dayOfWeek = $date->format('l'); // Get day of the week (e.g., 'Monday')
 
        
        $availableParavets = Vet::whereHas('availableTimes', function ($query) use ($dayOfWeek, $request) {
            $query->where('day', $dayOfWeek);

        })->with('availableTimes')->get();

        return response()->json($availableParavets);
    }

    // Method to create a paravet request
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|integer|exists:admin_users,id',
            'paravet_id' => 'required|integer|exists:vets,id',
            'location' => 'required|string',
            'description' => 'required|string',
            'date' => 'required|date',
            'time' => 'required|date_format:H:i',
        ]);
    
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
    
        // Check if the user has a pending request with the same paravet
        $existingRequest = ParavetRequest::where('user_id', $request->user_id)
            ->where('paravet_id', $request->paravet_id)
            ->where('status', 'pending')
            ->first();
    
        if ($existingRequest) {
            return response()->json([
                'message' => 'You already have a pending request for this paravet.',
            ], 400);
        }
    
        $paravetRequest = ParavetRequest::create($request->all());
    
        return response()->json([
            'message' => 'Request sent successfully',
            'paravetRequest' => $paravetRequest
        ], 201);
    }
    
    //delete a paravet request
    public function destroy($id)
    {
        $paravetRequest = ParavetRequest::find($id);

        if (!$paravetRequest) {
            return response()->json(['message' => 'Paravet request not found'], 404);
        }

        $paravetRequest->delete();

        return response()->json(['message' => 'Paravet request deleted'], 200);
    }

    // Method to fetch all paravet requests
    public function getRequestsOfAFarmer($id)
    {
        $paravetRequests = ParavetRequest::where('user_id',$id)->get();

        if (!$paravetRequests) {
            return response()->json(['message' => 'Paravet request not found'], 404);
        }

        $requests = [];
        foreach ($paravetRequests as $request) {
            $farmer = User::find($id);
            $requests[] = [
                'farmer' => $farmer,
                'request' => $request,
                'paravet' => Vet::find($request->paravet_id)
            ];
        }
        return response()->json($requests);
    }
   

    // Method to fetch paravet request belonging to a vet
    public function show($id)
    {
        $paravetRequest = ParavetRequest::where('paravet_id',$id)->get();

        if (!$paravetRequest) {
            return response()->json(['message' => 'Paravet request not found'], 404);
        }

        $requests = [];
        foreach ($paravetRequest as $request) {
            $paravet = Vet::find($id);
            $requests[] = [
                'paravet' => $paravet,
                'request' => $request,
                'farmer' => User::find($request->user_id)
            ];
        }   
        return response()->json($requests);
    }

    // Method to update a paravet request
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|string|in:accepted,rejected,completed',
            'paravet_id' => 'required|integer|exists:vets,id',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $paravetRequest = ParavetRequest::findOrFail($id);

        // Check if the authenticated user is the paravet associated with the request
        if ($paravetRequest->paravet_id != $request->paravet_id) {
            return response()->json([
                'message' => 'You are not authorized to update this request.'
            ], 403);
        }

        // Update the status of the request
        $paravetRequest->status = $request->status;
        $paravetRequest->save();

        return response()->json([
            'message' => 'Request status updated successfully',
            'paravetRequest' => $paravetRequest
        ], 200);
    }

       //function to get the totals of a patavet
       public static function getTotals($id)
       {
           $data = [
               'total_requests' => ParavetRequest::where('paravet_id', $id)->count(),
               'pending_requests' => ParavetRequest::where('paravet_id', $id)->where('status','pending')->count(),
               'completed_requests' => ParavetRequest::where('paravet_id', $id)->where('status','completed')->count(),
               'rejected_requests' => ParavetRequest::where('paravet_id', $id)->where('status','rejected')->count(),
               'accepted_requests' => ParavetRequest::where('paravet_id', $id)->where('status','accepted')->count(),

              ];
            
   
           return response()->json($data);
       }

}
