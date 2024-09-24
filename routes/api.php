<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Api\v1\EscuelasController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/login', [AuthController::class, 'login']);

Route::group([
    'middleware' => 'api',
    'prefix'=> 'auth'
], function($router){
    Route::post('/registro', [AuthController::class, 'registro']);
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:api');
    Route::post('/refresh', [AuthController::class, 'refresh'])->middleware('auth:api');
    Route::post('/perfil', [AuthController::class, 'perfil'])->middleware('auth:api');
});

//crear rutas de la escuela
Route::middleware('auth:api')->prefix('v1')->group(function(){

    Route::get('escuelas', [EscuelasController::class, 'index']);
    Route::put('escuelas/{id}',[EscuelasController::class, 'update']);
    Route::post('escuelas',[EscuelasController::class, 'store']);
    Route::delete('escuelas/{id}',[EscuelasController::class, 'destroy']);
    Route::get('escuelas/{id}',[EscuelasController::class, 'show']);
    //Route::post('escuelas/{id}',[EscuelasController::class, 'update']);

});
/*
https://www.youtube.com/watch?v=dUF4blOOZK4&t=1s
*/