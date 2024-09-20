<?php

use App\Http\Controllers\Auth\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


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

/*
https://www.youtube.com/watch?v=dUF4blOOZK4&t=1s
*/