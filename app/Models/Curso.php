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
        'id_modalidad',
        'descripcion_corta',
        'id_formacion',
        'duracion_numero',
        'id_duracion',
        'estado'
    ];

    public function extra()
    {
        return $this->hasOne(CursoExtra::class, 'curso_id');
    }
    public function ediciones()
    {
        return $this->hasMany(Edicion::class, 'id_curso');
    }

    public function categoria()
    {
    return $this->belongsTo(Categoria::class, 'id_categoria');
    }
    public function duracion()
    {
    return $this->belongsTo(Duracion::class, 'id_duracion');
    }

    public function formacion()
    {
    return $this->belongsTo(Formacion::class, 'id_formacion');
    }

    public function modalidad()
    {
    return $this->belongsTo(Modalidad::class, 'id_modalidad');
    }

}
