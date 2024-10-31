<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use App\Models\PreguntasFrecuentes;
use Illuminate\Support\Facades\DB;

class PreguntasController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $data = PreguntasFrecuentes::all();
            return $this->sendResponse($data, 'Listado de Preguntas Frecuentes.');
        } catch (\Exception $e) {
            return $this->sendError('Error de busqueda preguntas.', $e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        try {
            $data = PreguntasFrecuentes::findOrFail($id);
            if (is_null($data)) {
                return $this->sendError('No se encontró la pregunta', 'Escuela Not Found');
            }
            return $this->sendResponse($data, 'Pregunta encontrada correctamente.');
        } catch (\Exception $e) {
            return $this->sendError('Error al buscar la pregunta', $e->getMessage());
        }
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'pregunta' => 'required|string|max:255',
            'respuesta' => 'required|string|max:65535',

        ]);

        try {
            $escuela = PreguntasFrecuentes::create([
                'pregunta' => $validatedData['pregunta'],
                'respuesta' => $validatedData['respuesta']
            ]);
            return $this->sendResponse($escuela, 'Pregunta creada exitosamente.');
        } catch (\Exception $exception) {
            return $this->sendError('Error al crear una pregunta', $exception->getMessage());
        }


    }

    public function destroy($id)
    {
        try {
            $pregunta = PreguntasFrecuentes::find($id);
            if (is_null($pregunta)) {
                return $this->sendError('No se encontró la Pregunta', 'Pregunta Not Found');
            }
            $pregunta->delete();
            return $this->sendResponse($pregunta, 'Pregunta eliminada correctamente.');

        } catch (\Exception $e) {
            return $this->sendError('Error al buscar la pregunta', $e->getMessage());
        }
    }


    public function update(Request $request, $id)
    {
        try {
            $pregunta = PreguntasFrecuentes::find($id);
            if (is_null($pregunta)) {
                return $this->sendError('No se encontró la pregunta', 'Escuela Not Found');
            }
            $pregunta->update($request->all());
            
            return $this->sendResponse($pregunta, 'Pregunta actualizada correctamente.');

        } catch (\Exception $e) {
            return $this->sendError('Error al buscar la pregunta', $e->getMessage());
        }

    }

}