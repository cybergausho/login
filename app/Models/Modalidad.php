<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Modalidad extends Model
{

    use HasFactory;
    protected $table= 'aux_modalidad';
    protected $primaryKey = 'id_aux_modalidad';
    protected $fillable = ['nombre'];
    // Relación con cursos
    public function cursos()
    {
        return $this->hasMany(Curso::class, 'id_modalidad');
    }
}