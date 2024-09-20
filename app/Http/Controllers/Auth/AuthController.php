<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Validator;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class AuthController extends BaseController
{
    //
    public function registro(Request $request) {

        $validator = Validator::make($request->all(),[
            'name'=>'required|max:255',
            'email'=> 'required|email|max:50|unique:users',
            'password'=> 'required|min:6',
            'confirm_password' =>'required|same:password',
        ]);
        if ($validator->fails()) {  
            return $this->sendError('Error de validacion', $validator->errors());  
        }

        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['data'] = $user;
        
        return $this->sendResponse($success,'Usuario registrado correctamente.');

    }

    public function login() {
        $credenciales = request(['email', 'password']);
        if (!$token = auth()->attempt($credenciales)) {
            return $this->sendError('No se encuentra autorizado.');
        }
        $success= $this->responseWithToken($token);
        return $this->sendResponse($success,'Bienvenido.');
    }

    public function logout() {
        $success = auth()->logout(); 
        return $this->sendResponse($success,'Has cerrado la sesion.');
    }

    public function refresh() {
        $success = $this->responseWithToken(auth()->refresh()); 
        return $this->sendResponse($success,'Token actualizado.');
    }

    public function perfil() {
        $success = auth('')->user();
        return $this->sendResponse($success,'Perfil de manera exitosa.');
    }

    protected function responseWithToken($token){
        return [
            'access_token' => $token,
            'token_type'=> 'bearer',
            'expires_in' => auth()->factory()->getTTL() *60,
        ];
    }
}
