<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Edicion extends Model
{
    use HasFactory;

    protected $table= 'edicions';
    protected $fillable = [
        'id_curso',
        'id_escuela',
        'fecha_desde',
        'fecha_hasta',
        'fecha_apertura_inscripcion',
        'fecha_cierre_inscripcion',
        'id_user',
        'estado'
    ];

    public function escuela()
    {
    return $this->belongsTo(Escuela::class, 'id_escuela');
    }
    public function curso()
    {
    return $this->belongsTo(Curso::class, 'id_curso');
    }

    public function user()
    {
    return $this->belongsTo(User::class, 'id_user');
    }


}
