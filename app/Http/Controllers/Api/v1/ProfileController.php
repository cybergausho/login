<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\BaseController;
use App\Models\User;
use Illuminate\Http\Request;

class ProfileController extends BaseController
{
    public function update(Request $request){
        try {
        auth()->user()->update([$request->all()]);
        $user = auth()->user()->fresh();
        return $this->sendResponse($user, 'Usuario actualizado correctamente.');
    } catch (\Exception $e) {
        return $this->sendError('Error al actualizar usuario.', $e->getMessage());
    }
    }
}

