<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\BaseController;
use App\Models\Escuela;
use Illuminate\Http\Request;

class EscuelasController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $data = Escuela::all();
            return $this->sendResponse($data, 'Listado de Escuelas.');
        } catch (\Exception $e) {
            return $this->sendError('Error de busqueda escuelas.', $e->getMessage());
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        {
            try {
                $escuela = Escuela::create($request->all());
                return $this->sendResponse($escuela, 'Escuela creada exitosamente.');
            } catch (\Exception $exception) {
                return $this->sendError('Error al crear una escuela', $exception->getMessage());
            }
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        try {
            $data = Escuela::find($id);
            if (is_null($data)) {
                return $this->sendError('No se encontró la Escuela', 'Escuela Not Found');
            }
            return $this->sendResponse($data, 'Escuela Details Fetch Successfully !');
        } catch (\Exception $e) {
            return $this->sendError('Error al buscar Escuela', $e->getMessage());
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        try {
            $escuela = Escuela::find($id);
            if (is_null($escuela)) {
                return $this->sendError('No se encontró la Escuela', 'Escuela Not Found');
            }
            $escuela->cuatrigrama = $request->cuatrigrama;
            $escuela->nombre = $request->nombre;
            $escuela->telefono = $request->telefono;
            $escuela->email = $request->email;
            $escuela->provincia = $request->provincia;
            $escuela->localidad = $request->localidad;
            $escuela->maps = $request->maps;
            $escuela->estado = $request->estado;
            
            $escuela->save();
            return $this->sendResponse($escuela, 'Escuela actuallizada correctamente.');

        } catch (\Exception $e) {
            return $this->sendError('Error al buscar Escuela', $e->getMessage());
        }

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        try {
            $escuela = Escuela::find($id);
            if (is_null($escuela)) {
                return $this->sendError('No se encontró la Escuela', 'Escuela Not Found');
            }
            $escuela->delete();
            return $this->sendResponse($escuela, 'Escuela eliminada correctamente.');

        } catch (\Exception $e) {
            return $this->sendError('Error al buscar Escuela', $e->getMessage());
        }
    }
}
