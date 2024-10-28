<!-- resources/views/emails/notificacion.blade.php -->
<!DOCTYPE html>
<html>
<head>
    <title>Formulario de consulta sitio web Marina-Mercante</title>
</head>
<body>
    <h3>Consutla realizada por el sitio web de Marina Mercante.</h3>
    <p>Buenos días Estimado, <br> La persona {{ $datos['nombre'] }} {{ $datos['apellido'] }} con el mail {{ $datos['email'] }} realizo una consulta por la página de la Marina Mercante de la Prefectura Naval Argentina.</p>
    <p>El siguiente mensaje: <br> {{ $datos['mensaje'] }} </p>
</body>
</html>