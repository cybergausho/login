<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Duracion extends Model
{
    use HasFactory;
    protected $table= 'aux_duracion';
    protected $primaryKey = 'id_aux_duracion';

    protected $fillable = ['nombre'];
    // Relación con cursos
    public function cursos()
    {
        return $this->hasMany(Curso::class, 'id_duracion');
    }
}