<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contrato de Matrícula</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
        }
        .info {
            margin-bottom: 20px;
        }
        .info p {
            margin: 5px 0;
        }
        .firma {
            margin-top: 50px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Contrato de Matrícula para cerca</h1>
        
        <div class="info">
            <p><strong>Nombre del Alumno:</strong> {{ $matricula->nombre }} {{ $matricula->apellido }}</p>
            <p><strong>Rut:</strong> {{ $matricula->rut }}</p>
            
            <!-- Añade aquí más campos según tu modelo de Matricula -->
        </div>

        <p>
            Por medio del presente documento, el alumno se compromete a cumplir con las normas y reglamentos de la institución...
            <!-- Añade aquí el texto del contrato -->
        </p>

        <div class="firma">
            <p>____________________________</p>
            <p>Firma del Alumno</p>
        </div>
    </div>
</body>
</html>