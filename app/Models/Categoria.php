<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    use HasFactory;
    protected $table= 'aux_categoria';
    protected $primaryKey = 'id_aux_categoria';
    protected $fillable = ['nombre'];

    // Relación con cursos
    public function cursos()
    {
        return $this->hasMany(Curso::class, 'id_categoria');
    }
}