<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Api\v1\EscuelasController;
use App\Http\Controllers\Api\v1\CursosController;
use App\Http\Controllers\Api\v1\CorreosController;
use App\Http\Controllers\Api\v1\PreguntasController;
use App\Http\Controllers\Api\v1\SitiosController;

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

//crear rutas de la escuela y preguntas frecuentes
Route::middleware('auth:api')->prefix('v1')->group(function(){

    Route::put('escuelas/{id}',[EscuelasController::class, 'update']);
    Route::post('escuelas',[EscuelasController::class, 'store']);
    Route::delete('escuelas/{id}',[EscuelasController::class, 'destroy']);

    Route::put('preguntas/{id}',[PreguntasController::class, 'update']);
    Route::post('preguntas',[PreguntasController::class, 'store']);
    Route::delete('preguntas/{id}',[PreguntasController::class, 'destroy']);
});

Route::prefix('v1')->group(function(){
    Route::get('escuelas', [EscuelasController::class, 'index']);
    Route::get('escuelas/{id}',[EscuelasController::class, 'show']);
    //cursos
    Route::get('cursos', [CursosController::class, 'index']);
    Route::get('cursos/{id}',[CursosController::class, 'show']);
    Route::post('mail',[CorreosController::class, 'enviarCorreo']);
    //preguntas frecuentes
    Route::get('preguntas', [PreguntasController::class, 'index']);
    Route::get('preguntas/{id}',[PreguntasController::class, 'show']);
    //info de sitio (por ahora solo escuela abierta)
    Route::get('sitio_web',[SitiosController::class, 'index']);
});

// Route::middleware(['auth:api', 'rol:1'])->group(function () {
//     Route::get('/admin', function() {
//         return response()->json(['message' => 'Admin section']);
//     });
// });

// Route::middleware(['auth:api', 'rol:3'])->group(function () {
//     Route::get('/superadmin', function() {
//         return response()->json(['message' => 'Superadmin section']);
//     });
// });

// Route::middleware(['auth:api', 'rol:2'])->group(function () {
//     Route::get('/user', function() {
//         return response()->json(['message' => 'User section']);
//     });
// });