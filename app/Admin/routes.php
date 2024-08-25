<?php

use Illuminate\Routing\Router;
use App\Admin\Controllers\UserController;
use App\Admin\Controllers\FarmController;
use App\Admin\Controllers\FarmerController;
use App\Admin\Controllers\VetController;
use App\Admin\Controllers\ServiceProviderController;
use App\Admin\Controllers\HealthRecordController;
use App\Admin\Controllers\FarmAnimalController;
use App\Admin\Controllers\ParavetRequestController;
use App\Admin\Controllers\HomeController;



Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', [HomeController::class, 'index'])->name('home');
    $router->resource('users', UserController::class);
    $router->resource('farms', FarmController::class);
    $router->resource('farmers', FarmerController::class);
    $router->resource('vets', VetController::class);
    $router->resource('service-providers', ServiceProviderController::class);
    $router->resource('health-records', HealthRecordController::class);
    $router->resource('farm-animals', FarmAnimalController::class);
    $router->resource('paravet-requests', ParavetRequestController::class);


   
});
