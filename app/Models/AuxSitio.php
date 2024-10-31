<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AuxSitio extends Model
{
    protected $table= 'aux_sitio';
    protected $primaryKey = 'id_aux_sitio';

    protected $fillable = ['escuela'];
    
}