<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ServiceProviderController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\VetsController;
use App\Http\Controllers\FarmerController;
use App\Http\Controllers\FarmController;
use App\Http\Controllers\FarmAnimalController;
use App\Http\Controllers\HealthRecordController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\ParavetRequestController;
use App\Http\Controllers\RatingController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\UserRoleController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);
Route::post('/reset-password', [AuthController::class, 'resetPassword']);
Route::post('/send-reset-token', [AuthController::class, 'sendResetToken']);

//service provider registration routes
Route::post('/register-provider', [ServiceProviderController::class, 'store']);
Route::put('/provider/{id}', [ServiceProviderController::class, 'update']);
Route::get('/providers', [ServiceProviderController::class, 'index']);
Route::get('/provider/{id}', [ServiceProviderController::class, 'show']);
Route::delete('/provider/{id}', [ServiceProviderController::class, 'destroy']);

//vets registration routes
Route::get('/get-vets', [VetsController::class, 'index']);
Route::get('/get-vets/{id}', [VetsController::class, 'show']);
Route::post('/register-vets', [VetsController::class, 'store']);
Route::put('/update-vets/{id}', [VetsController::class, 'update']);
Route::delete('/delete-vets/{id}', [VetsController::class, 'destroy']);

//farmers registration routes
Route::get('/get-farmers', [FarmerController::class, 'index']);
Route::get('/get-farmers/{id}', [FarmerController::class, 'show']);
Route::post('/register-farmers', [FarmerController::class, 'store']);
Route::put('/update-farmers/{id}', [FarmerController::class, 'update']);
Route::delete('/delete-farmers/{id}', [FarmerController::class, 'destroy']);

/* make group route callded v2 and make it have this middleware JwtMiddleware */
Route::group(['middleware' => App\\Http\\Middleware\\JwtMiddlewar::class], function () {
    Route::get('/me', [AuthController::class, 'getAuthenticatedUser']);
});


// //protected routes for authenticated users
Route::group(['middleware' => ['auth:api']], function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', [AuthController::class, 'getAuthenticatedUser']);

    //farms registration routes
    Route::resource('/farms', FarmController::class);
    Route::get('/farmers-farms/{id}', [FarmController::class, 'showFarmerFarms']);

    //farm animals registration routes
    Route::resource('/animals', FarmAnimalController::class);
    Route::get('/farm-animals/{id}', [FarmAnimalController::class, 'getFarmAnimalsByFarm']);

    //health records registration routes
    Route::resource('/health-records', HealthRecordController::class);
    Route::get('/health-records-by-animal/{id}', [HealthRecordController::class, 'showHealthRecordsByAnimal']);
    Route::get('/health-records-by-farm/{id}', [HealthRecordController::class, 'showHealthRecordsByFarm']);
    Route::get('/health-records-by-vet/{id}', [HealthRecordController::class, 'showHealthRecordsByVet']);
    Route::get('/health-records-by-date/{date}', [HealthRecordController::class, 'showHealthRecordsByDate']);

    //product registration routes
    Route::resource('/products', ProductController::class);
    Route::get('/product/search', [ProductController::class, 'search']);
    Route::get('/categories', [ProductController::class, 'categories']);


    //cart registration routes
    Route::resource('/cart', CartController::class);


    // //order registration routes
    // Route::post('/order', [OrderController::class, 'store']);
    // Route::get('/order', [OrderController::class, 'index']);

    //paravet request registration routes
    Route::resource('/paravet-request', ParavetRequestController::class);
    Route::post('/get-available-paravets', [ParavetRequestController::class, 'availableParavets']);
    Route::get('/paravet-requests-stats/{id}', [ParavetRequestController::class, 'getTotals']);

    //paravet ratings
    Route::resource('/rate-paravet', RatingController::class);
    Route::get('/average-ratings', [RatingController::class, 'averageRating']);

    //notifications
    Route::resource('/notifications', NotificationController::class);

    //get user roles
    Route::get('/user-roles', [UserRoleController::class, 'show']);
});
