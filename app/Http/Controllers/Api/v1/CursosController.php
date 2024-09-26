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
            $data = Curso::all();
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
            $data = Curso::with('extra')->findOrFail($id);
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
            'id_formacion' => 'required|integer|exists:aux_formacion,id_aux_formacion',
            'duracion_numero' => 'required|integer',
            'id_duracion' => 'required|integer|exists:aux_duracion,id_aux_duracion',
            'estado' => 'boolean'
        ]);

        //inicia transaccion...

        DB::transaction(function () use ($validatedData) {
            $curso = Curso::create([
                'nombre' => $validatedData['nombre'],
                //... ...
            ]);

            // Crear la entrada en cursos_extra
            CursoExtra::create([
                'descripcion' => $validatedData['descripcion'],
                'curso_id' => $curso->id, // relacionar id
                //..continuara
            ]);
        });

        //return exitoso

    }

}