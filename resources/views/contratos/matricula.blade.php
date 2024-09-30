<!DOCTYPE html>
<html>
<head><meta http-equiv="cache-control" content="no-cache"><meta http-equiv="Pragma" content="no-cache"><meta http-equiv="Expires" content="-1">
<style type="text/css">
.body{padding-top: 10px; padding-left: 10px; padding-right: 10; padding-bottom: 10px;}
.lw { font-size: 20px; text-align: center; margin-top: 40px;}
.la { text-align: center; font-size: 18px; margin-left: 30px; }
.lb { text-align: right; font-size: 18px; margin-right: 50px; }
.lc { text-align: justify; font-size: 18px; }
.ld { font-weight: bold; margin-left: 10px;}
table, td, th {border-collapse: collapse; border: 2px solid; width: 100%;}

.le {list-style-type: upper-latin;}
.lf {font-style: normal; font-size: 18px;}
.logo {
            width: 90px;
            height: auto;
            margin-right: 20px;
            display: flex;
            align-items: flex-start;
            margin-bottom: 10px;
        }
.modulo {
            width: 100%;
            border-collapse: collapse;
        }

        .modulo th, .modulo td {
            border: 1px solid #000;
            padding: 8px;
            text-align: left;
        }

        .modulo th:nth-child(1), 
        .modulo td:nth-child(1) {
            width: 10%;
        }

        .modulo th:nth-child(3), 
        .modulo td:nth-child(3) {
            width: 10%;
        }

        .modulo th:nth-child(2), 
        .modulo td:nth-child(2) {
            width: 80%;
            
        }
        .modulo .yellow-background {
            background-color: yellow;
        }
        .modulo .green-background {
            background-color: green;
        }
        .modulo .rosybrown-background {
            background-color: rosybrown;
        }
        .modulo .vertical-text {
            writing-mode: vertical-rl;
            transform: rotate(0deg);
            text-align: center;
            vertical-align: middle;
            background-color: yellow;
            font-size: 16px;
        }
        .modulo .vertical-texto {
            writing-mode: vertical-rl;
            transform: rotate(0deg);
            text-align: center;
            vertical-align: middle;
            background-color: green;
            font-size: 16px;
        }
        .modulo .vertical-textos {
            writing-mode: vertical-rl;
            transform: rotate(0deg);
            text-align: center;
            vertical-align: middle;
            background-color: rosybrown;
            font-size: 16px;
        }
</style>


<title>Contrato</title>
</head>
<body class="body">
<!-- Start your code here -->
<img src="{{ public_path('images/logo.png') }}" alt="Logo de la Escuela" class="logo">

<p class="lw">Escuela de Conductores CERCA</p>
<h2 class="la">Control de Capacitación</h2>
<p class="lb">Temuco: {{ \Carbon\Carbon::parse($matricula->fecha_matricula)->format('d/m/Y') }}</p>
<p class="lc">Entre La Escuela de Conductores CERCA, Rut 76.018.710-0, en adelante la empresa y el alumno</p>
<p class="ld">DATOS DEL ALUMNO</p>
 <table>
  <tbody><tr>
    <th>Nombre del Alumno</th>
    <th colspan="3">{{ $matricula->nombre }} {{ $matricula->apellido }}</th>
  </tr>
  <tr>
    <td>C. de Identidad</td>
    <td>{{ $matricula->rut }}</td>
    <td>Edad</td>
    <td>{{ $matricula->edad}}</td>
  </tr>
  <tr>
    <td>Nº de Celular</td>
    <td>{{ $matricula->telefono}}</td>
    <td>E-mail</td>
    <td>{{ $matricula->correo}}</td>
  </tr>
  <tr>
    <td>Domicilio</td>
    <td colspan="3">{{ $matricula->direccion}}</td>
  </tr>
  <tr>
    <td>Comuna</td>
    <td>{{ $matricula->comuna}}</td>
    <td>Licencia Actual</td>
    <td>{{ $matricula->licencia_actual}}</td>
  </tr>
</tbody></table> 
<p class="lc">Quien declara que estos datos son fidedignos, tienen a bien acordar el siguiente contrato de capacitación</p>
<p class="ld">DATOS DEL CURSO</p>
<table>
  <tbody><tr>
    <th>Nombre del Curso</th>
    <th colspan="3">Curso conducente a la obtención Licencia A3 y/o A5 con SIT, presencial</th>
  </tr>
  <tr>
    <td>Licencia a que postula</td>
    @if($matricula->curso)
    <td>{{ $matricula->curso->curso }}</td>
    @endif
    <td>N° de Curso</td>
    @if($matricula->curso)
    <td>{{ $matricula->curso->codigo}}</td>
    @endif
  </tr>
  <tr>
    <td>Jornada de Clases</td>
    @if($matricula->curso)
    <td>{{ $matricula->curso->tipo }}</td>
    @endif
    <td>Fecha de inicio y Témino</td>
    <td></td>
  </tr>
</tbody></table> 
<p class="ld">INFORMACIÓN DE PAGO</p>
<p class="ld">Valor Curso:</p>
<table>
  <tbody><tr>
    <th>N°Cuota</th>
    <th>Valor</th>
    <th>Fecha Nacimiento</th>
    <th>Boleta o Factura</th>
    <th>Estado</th>
  </tr>
  @if($matricula->venta)
  <tr>
    <td>1</td>
    <td>{{ $matricula->venta->valor}}</td>
    <td>{{ $matricula->fecha_nacimiento}}</td>
    <td>{{ $matricula->venta->boleta }}</td>
    <td>{{ $matricula->venta->cancelado }}</td>
  </tr>
  @endif
  <tr>
    <td>2</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>3</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</tbody></table> 
<p class="ld">DE LAS OBLIGACIONES DE LA EMPRESA</p>
<p class="le">1. Facilitar Gabinete Psicotécnico en horarios de lunes a viernes de 10 a 19 hrs.<br>
    2. Los contenidos del curso se ajustan a las disposiciones del Ministerio de Transportes, contenidos en el Decreto 122, promulgada el 09 de julio de 2012.<br>3. La Empresa asegura la confidencialidad de los datos del cliente, especialmente en lo que dice relación con el Examen Psicológico al que se debe someter el postulante<br>
    4. Emitir el Certificado de Casa Moneda al término total del curso, cuando el alumno haya aprobado todos sus módulos.<br>
    5. La Empresa facilitará el Bus y/o el Camión con remolque a aquellos alumnos que deben rendir sus exámenes de Práctica de Conducción ante las Direcciones de Tránsito de Temuco o de Padre Las Casas.<br>
    6. En caso que el alumno repruebe el Examen Teórico ante la Dirección de Tránsito, tendrá derecho a repetir aquellos módulos que significaron la reprobación, sin costos adicionales.<br>
    7. La Empresa realizará el Curso conducente a la obtención de la Licencia de Conductor Profesional Clase A3 y/o A5, bajo las siguientes características</p>
<table class="modulo">
  <tbody><tr>
    <th>MODULOS</th>
    <th>NOMBRE SEGÚN DECRETO</th>
    <th></th>
  </tr>
  <tr>
    <td class="yellow-background">MÓD, 1</td>
    <td class="yellow-background">Conceptos Básicos y Aspectos Generales de la Ley de Tránsito</td>
    <th class="vertical-text" rowspan="11">PLAN COMUN</th>
  </tr>
  <tr>
    <td class="yellow-background">MÓD, 2</td>
    <td class="yellow-background">Principios Físicos que intervienen en el Movimiento de los Vehículos</td>
    
  </tr>
  <tr>
    <td class="yellow-background">MÓD, 3</td>
    <td class="yellow-background">Funcionamiento de los vehículos</td>
    
  </tr>
  <tr>
    <td class="yellow-background">MÓD, 4</td>
    <td class="yellow-background">Técnicas de conducción eficiente e importancia de su aplicación.</td>
    
  </tr>
  <tr>
    <td class="yellow-background">MÓD, 5</td>
    <td class="yellow-background">Técnicas, destrezas y habilidades necesarias para la conducción según el tipo de vehículo</td>
    
  </tr>
  <tr>
    <td class="yellow-background">MÓD, 6</td>
    <td class="yellow-background">Aptitud física y mental para una conducción segura.</td>
    
  </tr>
  <tr>
    <td class="yellow-background">MÓD, 7</td>
    <td class="yellow-background">Legislación laboral: Derechos y deberes del conductor</td>
    
  </tr>
  <tr>
    <td class="yellow-background">MÓD, 8</td>
    <td class="yellow-background">Reglamentación medioambiental y de sanidad vegetal.</td>
    
  </tr>
  <tr>
    <td class="yellow-background">MÓD, 9</td>
    <td class="yellow-background">Responsabilidad civil y penal del conductor.</td>
    
  </tr>
  <tr>
    <td class="yellow-background">MÓD, 10</td>
    <td class="yellow-background">Primeros Auxilios.</td>
    
  </tr>
  <tr>
    <td class="yellow-background">MÓD, 11</td>
    <td class="yellow-background">Herramientas y destrezas para una conducción segura</td>
    
  </tr>
  <tr>
    <td class="green-background">MÓD, 12</td>
    <td class="green-background">Procedimientos y normativa vigente específica aplicable al transporte de pasajeros.</td>
    <th class="vertical-texto" rowspan="3">A3</th>
  </tr>
  <tr>
    <td class="green-background">MÓD, 13</td>
    <td class="green-background">Calidad de servicio y herramientas para su aplicación.</td>
    
  </tr>
  <tr>
    <td class="green-background">MÓD, 14</td>
    <td class="green-background">Prevención y Combate de Incendios.</td>
    
  </tr>
  <tr>
    <td class="rosybrown-background">MÓD, 15</td>
    <td class="rosybrown-background">Procedimientos y normativa vigente específica al sector transporte de carga.</td>
    <th class="vertical-textos" rowspan="5">A5</th>
  </tr>
  <tr>
    <td class="rosybrown-background">MÓD, 16</td>
    <td class="rosybrown-background">Procedimientos de operaciones de carga y descarga segura</td>
    
  </tr>
  <tr>
    <td class="rosybrown-background">MÓD, 17</td>
    <td class="rosybrown-background">Trámites y procedimientos asociados al transporte internacional e intermodal.</td>
    
  </tr>
  <tr>
    <td class="rosybrown-background">MÓD, 18</td>
    <td class="rosybrown-background">Calidad de servicio y herramientas para su aplicación.</td>
    
  </tr>
  <tr>
    <td class="rosybrown-background">MÓD, 19</td>
    <td class="rosybrown-background">Prevención y combate de incendios.</td>
    
  </tr>
</tbody></table>    
<p class="lc"><b>Acerca de las Prácticas de Conducción:</b> Se agendarán una vez que el alumno finalice el Plan Común. Estas prácticas se dividen en 2 partes y se realizan por cada licencia a la que postule:<br> <b>Práctica en Simulador de Inmersión Total:</b> se realizarán 10 sesiones de 30 minutos cada una en grupos de 2 a 3 personas.<br>
<b>Práctica de Conducción en Bus:</b> se realizarán 6 clases de 60 minutos en minibús para 12 pasajeros y 6 clases de 60 minutos en Bus para 28 pasajeros.<br>
<b>Práctica de Conducción en Camión Articulado:</b> se realizarán 6 prácticas de 60 minutos en camión solo y 6 prácticas de conducción en Camión con remolque.<br>
<b>Importante: Las clases prácticas agendadas pueden estar sujetas a cambios según disposición de la Escuela</b></p> 

<p class="ld">OBLIGACIONES DEL ALUMNO(A)</p>

<p class="lf">1. El Alumno declara que cumple con los siguientes requisitos para la realización del curso:<br>
        </p><ol> a Tener como mínimo 20 años de edad</ol>
        <ol> b. Acreditar, mediante su Hoja de Vida del Conductor, tener Licencia Clase B, a lo menos por dos años</ol>
    2. Al momento de matricularse, debe someterse a un examen Senso Psicométrico y a un Examen Psicológico. <br>
    3. Cumplir con los porcentajes mínimos de aprobación:<br>
        <ol> a. Teoría: Asistencia 80% y Evaluación de cada módulo 75%</ol>
        <ol> b. Prácticas: Asistencia 100% y Evaluación 75%</ol>
    4. El alumno deberá cancelar la totalidad del valor del curso para que se entregue el correspondiente Certificado Casa de Moneda que le permite iniciar su trámite de obtención de Licencia, ante la Dirección de Tránsito respectiva.<br><br>
<b>LA POSTERGACIÓN Y/O ANULACIÓN DEL CURSO:</b> sólo se podrá realizar con 48 horas de anticipación a la fecha de inicio del curso y se descontará un <b>35% del valor total del curso,</b> por lo que una vez vencido el plazo no se podrá anular el curso. <br><br>
Ambas partes declaran conocer en toda su extensión este contrato y aceptado los términos y condiciones del contrato de Capacitación de CERCA Ltda.<p></p>

<p class="ld">Nombre del Alumno:__{{ $matricula->nombre }} {{ $matricula->apellido }}</p><br>

<p class="ld">Firma del Alumno:____________________________________________________</p><br>

<p class="ld">Escuela de Conductores CERCA</p>
<p class="ld">RUT : 76.018.710-0</p>

<!-- End your code here -->
</body>
</html>