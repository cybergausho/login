<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Curso extends Model
{
    use HasFactory;

    protected $table= 'cursos';
    protected $fillable = [
        'nombre',
        'id_categoria',
        'id_formacion',
        'duracion_numero',
        'id_duracion',
        'estado'
    ];

    public function extra()
    {
        return $this->hasOne(CursoExtra::class, 'curso_id');
    }

}
