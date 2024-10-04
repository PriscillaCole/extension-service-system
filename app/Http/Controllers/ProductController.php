<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use App\Models\Utils;
use App\Models\ServiceProvider;
use App\Models\Farmer;

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
            'category' => 'required|string',
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
            'category' => 'required|string',
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
    
        $productDetails = [];
        // For each product, check if the provider_id is not null, get the provider object or the farmer object
        foreach ($products as $product) {
            if ($product->provider_id) {
                $provider = ServiceProvider::find($product->provider_id);
                $productDetails[] = [
                    'product' => $product,
                    'provider' => $provider
                ];
            } else {
                $farmer = Farmer::find($product->farmer_id);
                $productDetails[] = [
                    'product' => $product,
                    'farmer' => $farmer
                ];
            }
        }
    
        return response()->json($productDetails);
    }
    


  public function search(Request $request)
{
    $query = $request->input('query');
    $category = $request->input('category');

    // Initialize the product query
    $productsQuery = Product::query();

    // Apply search filters
    if ($query) {
        $productsQuery->where(function($q) use ($query) {
            $q->where('name', 'LIKE', "%{$query}%")
              ->orWhere('description', 'LIKE', "%{$query}%");
        });
    }

    if ($category) {
        $productsQuery->where('category', $category);
    }

    // Get the filtered products
    $products = $productsQuery->get();

    // Initialize an array to hold the product details
    $productDetails = [];

    // For each product, check if the provider_id is not null and get the respective provider or farmer object
    foreach ($products as $product) {
        if ($product->provider_id) {
            $provider = ServiceProvider::find($product->provider_id);
            $productDetails[] = [
                'product' => $product,
                'provider' => $provider
            ];
        } else {
            $farmer = Farmer::find($product->farmer_id);
            $productDetails[] = [
                'product' => $product,
                'farmer' => $farmer
            ];
        }
    }

    // Return the product details as a JSON response
    return response()->json($productDetails);
}


    public function categories()
    {
        return response()->json(config('categories'));
    }

    public function show($id)
    {
        $products = Product::where('provider_id', $id)->get();
    
        $productDetails = [];
        // For each product, check if the provider_id is not null, get the provider object or the farmer object
        foreach ($products as $product) {
            if ($product->provider_id) {
                $provider = ServiceProvider::find($product->provider_id);
                $productDetails[] = [
                    'product' => $product,
                    'provider' => $provider
                ];
            } else {
                $farmer = Farmer::find($product->farmer_id);
                $productDetails[] = [
                    'product' => $product,
                    'farmer' => $farmer
                ];
            }
        }
    
        return response()->json($productDetails);
    }
    


}
