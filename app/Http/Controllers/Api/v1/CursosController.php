<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use App\Models\Curso;
use App\Models\CursoExtra;
use Illuminate\Support\Facades\DB;

class CursosController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $data = Curso::with(['categoria', 'formacion', 'duracion', 'modalidad'])->get();
            return $this->sendResponse($data, 'Listado de Cursos.');
        } catch (\Exception $e) {
            return $this->sendError('Error de busqueda cursos.', $e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        try {
            //$data = Curso::find($id);
            // Usar eager loading para traer también los datos de cursos_extra
            $data = Curso::with([ 'categoria', 'formacion', 'duracion', 'modalidad', 'extra', 'ediciones', 'ediciones.escuela' ])->findOrFail($id);
            if (is_null($data)) {
                return $this->sendError('No se encontró el curso', 'Escuela Not Found');
            }
            return $this->sendResponse($data, 'Curso encontrada correctamente.');
        } catch (\Exception $e) {
            return $this->sendError('Error al buscar el curso', $e->getMessage());
        }
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'nombre' => 'required|string|max:255',
            'id_categoria' => 'required|integer|exists:aux_categoria,id_aux_categoria',
            'id_modalidad' => 'required|integer|exists:aux_modalidad,id_aux_modalidad',
            'descripcion_corta' => 'required|string|max:255',
            'id_formacion' => 'required|integer|exists:aux_formacion,id_aux_formacion',
            'duracion_numero' => 'required|integer',
            'id_duracion' => 'required|integer|exists:aux_duracion,id_aux_duracion',
            'estado' => 'boolean',
            'destinatario' => 'string|max:255',
            'requisitos' => 'string|max:255',
            'objetivo' => 'string|max:300',
            'descripcion_larga' => 'string|max:255',
            'foto' => 'string|max:255',
            'asignatura' => 'string|max:255',

        ]);

        //inicia transaccion...

        DB::transaction(function () use ($validatedData) {
            $curso = Curso::create([
                'nombre' => $validatedData['nombre'],
                'id_categoria' => $validatedData['id_categoria'],
                'id_modalidad' => $validatedData['id_modalidad'],
                'descripcion_corta' => $validatedData['descripcion_corta'],
                'id_formacion' => $validatedData['id_formacion'],
                'duracion_numero' => $validatedData['duracion_numero'],
                'id_duracion' => $validatedData['id_duracion'],
                'estado' => $validatedData['estado']
            ]);

            // Crear la entrada en cursos_extra
            CursoExtra::create([
                'curso_id' => $curso->id, // relacionar id
                'destinatario' => $validatedData['descripcion'],
                'requisitos' => $validatedData['descripcion'],
                'objetivo' => $validatedData['descripcion'],
                'descripcion_larga' => $validatedData['descripcion'],
                'foto' => $validatedData['descripcion'],
                'asignatura' > $validatedData['asignatura']

            ]);
        });

        //return exitoso
        return $this->sendResponse($validatedData, 'Curso creado con exito.');

    }

}