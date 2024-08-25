<?php
namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Tymon\JWTAuth\Facades\JWTAuth;

class CartController extends Controller
{
    public function store(Request $request)
    {
        $rules = [
            'user_id' => 'required|exists:admin_users,id',
            'product_id' => 'required|exists:products,id',
            'quantity' => 'required|integer|min:1',
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
  
        $cart = Cart::Create(
            ['user_id' => $validatedData['user_id'], 'product_id' => $validatedData['product_id'], 
            'quantity' => $validatedData['quantity']]
        
        );

        return response()->json([
            'message' => 'Item added to cart successfully',
            'cart' => $cart
        ], 200);
    }

    //delete item from cart
    public function delete($id)
    {
        $cart = Cart::find($id);
        if ($cart) {
            $cart->delete();
            return response()->json(['message' => 'Item removed from cart'], 200);
        } else {
            return response()->json(['message' => 'Item not found in cart'], 404);
        }
    }

    //edit item in cart
    public function update(Request $request, $id)
    {
        $rules = [
            'user_id' => 'required|exists:admin_users,id',
            'quantity' => 'required|integer|min:1',
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

        $cart = Cart::where('id', $id)->where('user_id', $validatedData['user_id'])->first();
        if ($cart) {
            $cart->quantity = $request->quantity;
            $cart->save();
            return response()->json($cart, 200);
        } else {
            return response()->json(['message' => 'Item not found in cart'], 404);
        }
    }

    public function index()
    {
        $cartItems = Cart::where('user_id', Auth::id())->get();
        return response()->json($cartItems);
    }
}

