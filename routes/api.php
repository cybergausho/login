<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Api\v1\EscuelasController;
use App\Http\Controllers\Api\v1\CursosController;

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

    Route::put('escuelas/{id}',[EscuelasController::class, 'update']);
    Route::post('escuelas',[EscuelasController::class, 'store']);
    Route::delete('escuelas/{id}',[EscuelasController::class, 'destroy']);
});

Route::prefix('v1')->group(function(){
    Route::get('escuelas', [EscuelasController::class, 'index']);
    Route::get('escuelas/{id}',[EscuelasController::class, 'show']);
    //cursos
    Route::get('cursos', [CursosController::class, 'index']);
    Route::get('cursos/{id}',[CursosController::class, 'show']);
});
