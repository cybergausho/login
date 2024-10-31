<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\BaseController;
use App\Models\AuxSitio;
use Illuminate\Http\Request;

class SitiosController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $data = AuxSitio::all();
            return $this->sendResponse($data, 'Info auxiliar del sitio.');
        } catch (\Exception $e) {
            return $this->sendError('Error al buscar informacion auxiliar.', $e->getMessage());
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    
    public function show($id)
    {
        try {
            $data = AuxSitio::find($id);
            if (is_null($data)) {
                return $this->sendError('No se encontró la información', 'Informacion Not Found');
            }
            return $this->sendResponse($data, 'Inormación encontrada correctamente.');
        } catch (\Exception $e) {
            return $this->sendError('Error al buscar información', $e->getMessage());
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        try {
            $info = AuxSitio::find($id);
            if (is_null($info)) {
                return $this->sendError('No se encontró la informacion', 'Info Not Found');
            }
            $info->update($request->all());
            
            return $this->sendResponse($info, 'Informacion actualizada correctamente.');

        } catch (\Exception $e) {
            return $this->sendError('Error al buscar la inforsmacion', $e->getMessage());
        }

    }

}
