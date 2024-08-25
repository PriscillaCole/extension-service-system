<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use App\Models\Utils;

class ProductController extends Controller
{

    //create product
    public function store(Request $request)
    {
        $rules =[
            'provider_id' => 'nullable|exists:service_providers,id',
            'farmer_id' => 'nullable|exists:farmers,id',
            'name' => 'required|string',
            'description' => 'required|string',
            'manufacturer' => 'required|string',
            'price' => 'required|numeric',
            'quantity_available' => 'required|integer',
            'expiry_date' => 'nullable|date',
            'storage_conditions' => 'nullable|string',
            'usage_instructions' => 'nullable|string',
            'warnings' => 'nullable|string',
            'status' => 'required|string',
            'image' => 'required|string',
            'stock' => 'required|integer',
            'category' => 'required|string|in:' . implode(',', config('categories')),
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

            
        if ($request->has('image')) {
            $validatedData['image'] = Utils::storeBase64Image($request->input('image'), 'images');
        }


        $product = Product::create($validatedData);

        
        return response()->json([
            'message' => 'Product created successfully',
            'farm' => $product
        ], 200);
    }

    //update product
     public function update(Request $request, $id)
    {
        $rules =[
            'provider_id' => 'nullable|exists:service_providers,id',
            'farmer_id' => 'nullable|exists:farmers,id',
            'name' => 'required|string',
            'description' => 'required|string',
            'manufacturer' => 'required|string',
            'price' => 'required|numeric',
            'quantity_available' => 'required|integer',
            'expiry_date' => 'nullable|date',
            'storage_conditions' => 'nullable|string',
            'usage_instructions' => 'nullable|string',
            'warnings' => 'nullable|string',
            'status' => 'required|string',
            'image' => 'required|string',
            'stock' => 'required|integer',
            'category' => 'required|string|in:' . implode(',', config('categories')),
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

        $product = Product::find($id);

        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }

        if ($request->has('image')) {
            $validatedData['image'] = Utils::storeBase64Image($request->input('image'), 'images');
        }

        $product->update($validatedData);

        return response()->json([
            'message' => 'Product updated successfully',
            'product' => $product
        ], 200);
    }
 
    //delete product
    public function destroy($id)
    {
        $product = Product::find($id);

        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }

        $product->delete();

        return response()->json(['message' => 'Product deleted successfully'], 200);
    }

    //get all products
    public function index()
    {
        $products = Product::all();
        return response()->json($products);
    }


    public function search(Request $request)
    {
        $query = $request->input('query');
        $category = $request->input('category');

        $products = Product::query();

        if ($query) {
            $products->where('name', 'LIKE', "%{$query}%")
                     ->orWhere('description', 'LIKE', "%{$query}%");
        }

        if ($category) {
            $products->where('category', $category);
        }

        return response()->json($products->get());
    }

    public function categories()
    {
        return response()->json(config('categories'));
    }

    //get products belonging to a user
    public function show($id)
    {
        $products = Product::where('provider_id', $id)->get();
        return response()->json($products);
    }


}
