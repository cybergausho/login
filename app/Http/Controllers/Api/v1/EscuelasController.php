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
        $validatedData = $request->validate([
            'cuatrigrama' => 'required|string|max:5',
            'nombre' => 'required|string|max:255',
            'telefono' => 'required|string|max:50',
            'email' => 'required|string|max:255',
            'provincia' => 'required|int|max:10',
            'localidad'=> 'required|int|max:10',
            'maps' => 'required|string|max:255',
            'estado' => 'boolean',

        ]);
            try {
                $escuela = Escuela::create([
                    'cuatrigrama' => $validatedData['cuatrigrama'],
                    'nombre' =>  $validatedData['nombre'],
                    'telefono' =>  $validatedData['telefono'],
                    'email' =>  $validatedData['email'],
                    'provincia' =>  $validatedData['provincia'],
                    'localidad'=>  $validatedData['localidad'],
                    'maps' =>  $validatedData['maps'],
                    'estado' =>  $validatedData['estado']
                ]);
                return $this->sendResponse($escuela, 'Escuela creada exitosamente.');
            } catch (\Exception $exception) {
                return $this->sendError('Error al crear una escuela', $exception->getMessage());
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
            return $this->sendResponse($data, 'Escuela encontrada correctamente.');
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
            $escuela->update($request->all());
            
            return $this->sendResponse($escuela, 'Escuela actualizada correctamente.');

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
