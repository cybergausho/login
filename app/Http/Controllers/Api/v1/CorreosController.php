<?php 
namespace App\Http\Controllers\Api\v1;

use App\Mail\MailController;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use App\Models\Curso;
use App\Models\CursoExtra;
use Illuminate\Support\Facades\DB;

class CorreosController extends BaseController
{


public function enviarCorreo(Request $request)
{
    $datos = [
        'nombre' => $request->input('nombre'),
        'apellido' => $request->input('apellido'),
        'telefono' => $request->input('telefono'),
        'dni' => $request->input('dni'),
        'mensaje' => $request->input('mensaje'),
        'emailInteresado' =>$request->input('emailInteresado'),
        'email' =>$request->input('email'),
        'novedades' => $request->input('novedades')
    ];
    try {
    Mail::to($datos['email'])->send((new MailController($datos))->subject('Consulta sitio marina-mercante'));
    
    if (is_null($datos)) {
        return $this->sendError('Error de datos', 'Correo electronico no encontrado.');
    }
    return $this->sendResponse($datos, "Correo enviado con exito.");
} catch (\Exception $e) {
    return $this->sendError('Error al enviar el email.', $e->getMessage());
}

}

}



