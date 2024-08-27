<?php

namespace App\Http\Controllers;

use App\Models\ParavetRating;
use App\Models\Vet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class RatingController extends Controller
{
    public function store(Request $request)
    {
       
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:admin_users,id',
            'paravet_id' => 'required|exists:vets,id',
            'rating' => 'required|integer|min:1|max:5',
            'comment' => 'nullable|string',
        ]);
        
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
    
        $paravetRating = ParavetRating::create([
            'user_id' => $request->user_id,
            'paravet_id' => $request->paravet_id,
            'rating' => $request->rating,
            'comment' => $request->comment,
        ]);
    
        return response()->json([
            'message' => 'Rating submitted successfully',
            'paravetRating' => $paravetRating
        ], 201);
    }
    
    public static function index()
    {
        // Fetch all paravets with their ratings and average rating
        $paravets = Vet::with(['ratings' => function ($query) {
            $query->latest(); // Fetch ratings in descending order by default
        }])->get();
    
        // Calculate average ratings for each paravet
        $paravets->each(function ($paravet) {
            $paravet->averageRating = $paravet->averageRating();
        });
    
        return view('ratings', compact('paravets'));
    }

    //function to delete rating 
    public function destroy($id)
    {
        $rating = ParavetRating::find($id);
        if (!$rating) {
            return response()->json(['message' => 'Rating not found'], 404);
        }

        $rating->delete();
        return response()->json(['message' => 'Rating deleted successfully']);
    }

    //function to update rating
    public function update(Request $request, $id)
    {
        $rating = ParavetRating::find($id);
        if (!$rating) {
            return response()->json(['message' => 'Rating not found'], 404);
        }

        $validator = Validator::make($request->all(), [
    
            'rating' => 'required|integer|min:1|max:5',
            'comment' => 'nullable|string',
        ]);
        
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }
    

        $rating->update([
            'rating' => $request->rating,
            'comment' => $request->comment,
        ]);

        return response()->json([
            'message' => 'Rating updated successfully',
            'paravetRating' => $rating
        ], 201);
    }

    //function to get  rating of a paravet
    public function show($id)
    {
        $paravet = Vet::with('ratings')->find($id);
        if (!$paravet) {
            return response()->json(['message' => 'Paravet not found'], 404);
        }

        $paravet->averageRating = $paravet->averageRating();
        return response()->json($paravet);
    }

    //function to get average rating of all paravets
    public static function averageRating()
    {
        // Fetch all paravets with their average rating
        $paravets = Vet::with('ratings')->get()->map(function ($paravet) {
            return [
                'id' => $paravet->id,
                'name' => $paravet->title . ' ' . $paravet->surname . ' ' . $paravet->given_name,
                'averageRating' => $paravet->averageRating(),
            ];
        });
    
        return response()->json([
            'message' => 'Paravets with average ratings retrieved successfully',
            'paravets' => $paravets
        ]);
    }
    

    
}