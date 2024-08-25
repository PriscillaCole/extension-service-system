<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FarmActivityController;
use App\Admin\Controllers\HomeController; 

use App\Admin\Controllers\FarmAnimalController;
use App\Admin\Controllers\HealthRecordController;
use App\Http\Controllers\RatingController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application.
| These routes are loaded by the RouteServiceProvider and assigned to the "web" middleware group.
| Now create something great!
|
*/

Route::view('auth/register', 'auth.register');
Route::get('/user-activity', [HomeController::class, 'index'])->name('user-activity');


Route::get('farmers-farms/{id}', [FarmAnimalController::class, 'getFarms'])->name('farm.animals');
Route::get('farms-animals/{id}', [HealthRecordController::class, 'getAnimals'])->name('farm.animals');
Route::get('farmer-farms/{id}', [HealthRecordController::class, 'getFarms'])->name('farm.animals');

Route::post('/ratings', [RatingController::class, 'store'])->name('ratings.store');
Route::get('/paravets', [RatingController::class, 'index'])->name('paravet-ratings.index');
Route::get('/paravet-ratings', [HomeController::class, 'ratings']);




Auth::routes();

Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
