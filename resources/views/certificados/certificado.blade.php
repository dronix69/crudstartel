<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certificado en una sola página</title>
    <style>
        @page {
            size: 232mm 309mm;
            margin: 0;
        }
        body {
            margin: 0;
            padding: 0;
            width: 499px;
            height: 1168px;
        }
        .hoja {
            width: 232mm;
            height: 309mm;
            position: relative;
            background-color: #fff;
            page-break-after: avoid;
            overflow: hidden;
        }
        .elemento {
            position: absolute;
            font-family: Arial, sans-serif;
        }
        #cerca {
            top: 267px;
            left: 310px;
            font-size: 24px;
            font-weight: bold;
        }
        #escuela {
            top: 302px;
            left: 209px;
        }
        #rut {
            top: 302px;
            left: 605px;
        }
        #belloun {
            top: 331px;
            left: 268px;
        }
        #tenun {
            top: 352px;
            left: 182px;
        }
        #novena {
            top: 352px;
            left: 608px;
        }
        #codun {
            top: 388px;
            left: 431px;
        }
        #fecun {
            top: 388px;
            left: 595px;
        }
        #codos {
            top: 418px;
            left: 457px;
        }
        #fecdo {
            top: 418px;
            left: 599px;
        }
        #nombre {
            top: 522px;
            left: 181px;
            font-size: 22px;
            font-weight: bold;
        }
        #rutal {
            top: 555px;
            left: 147px;
        }
        #curso {
            top: 589px;
            left: 638px;
        }
        #sit {
            top: 642px;
            left: 282px;
        }
        #novenan {
            top: 677px;
            left: 610px;
        }
        #bellom {
            top: 701px;
            left: 228px;
        }
        #temuco {
            top: 729px;
            left: 224px;
        }
        #novenatre {
            top: 729px;
            left: 608px;
        }
        #codigo {
            top: 755px;
            left: 220px;
        }
        #finicio {
            top: 755px;
            left: 530px;
        }
        #ftermino {
            top: 755px;
            left: 650px;
        }
        #jorge {
            top: 842px;
            left: 177px;
        }
        #jorgerut {
            top: 868px;
            left: 163px;
        }
        #temucotres {
            top: 1079px;
            left: 98px;
        }
        #fnow {
            top: 1079px;
            left: 193px;
        }
    </style>
</head>
<body>
    <div class="hoja">
        <div id="cerca" class="elemento">Cerca Ltda</div>
        <div id="escuela" class="elemento">Centro de Estudios Regionales y Capac ltda</div>
        <div id="rut" class="elemento">76.018.710-0</div>
        <div id="belloun" class="elemento">Andres Bello 1180</div>
        <div id="tenun" class="elemento">Temuco</div>
        <div id="novena" class="elemento">Novena</div>
        <div id="codun" class="elemento">860</div>
        <div id="fecun" class="elemento">02-10-2023</div>
        <div id="codos" class="elemento">260</div>
        <div id="fecdo" class="elemento">02-04-2014</div>
        <div id="nombre" class="elemento">{{ $certificado->nombre }} {{ $certificado->apellido }}</div>
        <div id="rutal" class="elemento">{{ $certificado->rut }}</div>
        <div id="curso" class="elemento">{{ $certificado->curso }}</div>
        <div id="sit" class="elemento">Especial con Simulador de Inmersión Total</div>
        <div id="novenan" class="elemento">Novena</div>
        <div id="bellom" class="elemento">Andres Bello 1180</div>
        <div id="temuco" class="elemento">Temuco</div>
        <div id="novenatre" class="elemento">Novena</div>
        <div id="codigo" class="elemento">{{ $certificado->codigo_curso }}</div>
        <div id="finicio" class="elemento">{{ \Carbon\Carbon::parse($certificado->fecha_ini)->format('d/m/Y') }}</div>
        <div id="ftermino" class="elemento">{{ \Carbon\Carbon::parse($certificado->fecha_fin)->format('d/m/Y') }}</div>
        <div id="jorge" class="elemento">Jorge Romero Fuentes</div>
        <div id="jorgerut" class="elemento">6.886.183-7</div>
        <div id="temucotres" class="elemento">Temuco:</div>
        <div id="fnow" class="elemento">{{ \Carbon\Carbon::parse($certificado->fecha_otorgado)->locale('es')->isoFormat('D [de] MMMM [de] YYYY') }}</div>
    </div>
</body>
</html>