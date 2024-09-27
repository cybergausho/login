<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Formacion extends Model
{
    protected $table= 'aux_formacion';
    protected $primaryKey = 'id_aux_formacion';

    protected $fillable = ['nombre'];
    // Relación con cursos
    public function cursos()
    {
        return $this->hasMany(Curso::class, 'id_formacion');
    }
}