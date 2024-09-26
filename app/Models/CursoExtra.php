<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CursoExtra extends Model
{
    use HasFactory;

    protected $table= 'curso_extras';
    protected $fillable = [
        'destinatario',
        'requisitos',
        'objetivo',
        'descripcion_larga',
        'descripcion_corta',
        'foto',
        'asignatura'
    ];

    public function curso(){
      return $this->belongsTo(Curso::class, foreignKey: 'curso_id');
    }
}
