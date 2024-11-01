<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Escuela extends Model
{
    use HasFactory;

    protected $table= 'escuelas';
    protected $fillable = [
        'cuatrigrama',
        'nombre',
        'telefono',
        'email',
        'provincia',
        'localidad',
        'maps',
        'estado' => 1
    ];
    
}
