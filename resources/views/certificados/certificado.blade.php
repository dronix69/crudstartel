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
            top: 166px;
            left: 255px;
            font-size: 24px;
            font-weight: bold;
        }
        #escuela {
            top: 193px;
            left: 146px;
        }
        #rut {
            top: 193px;
            left: 503px;
        }
        #belloun {
            top: 219px;
            left: 203px;
        }
        #tenun {
            top: 250px;
            left: 118px;
        }
        #novena {
            top: 250px;
            left: 523px;
        }
        #codun {
            top: 275px;
            left: 351px;
        }
        #fecun {
            top: 275px;
            left: 503px;
        }
        #codos {
            top: 300px;
            left: 371px;
        }
        #fecdo {
            top: 300px;
            left: 516px;
        }
        #nombre {
            top: 400px;
            left: 150px;
        }
        #rutal {
            top: 430px;
            left: 120px;
        }
        #curso {
            top: 460px;
            left: 536px;
        }
        #sit {
            top: 511px;
            left: 209px;
        }
        #novenan {
            top: 545px;
            left: 520px;
        }
        #bellom {
            top: 568px;
            left: 164px;
        }
        #temuco {
            top: 593px;
            left: 160px;
        }
        #novenatre {
            top: 593px;
            left: 521px;
        }
        #codigo {
            top: 619px;
            left: 156px;
        }
        #finicio {
            top: 619px;
            left: 444px;
        }
        #ftermino {
            top: 619px;
            left: 558px;
        }
        #jorge {
            top: 680px;
            left: 130px;
        }
        #jorgerut {
            top: 700px;
            left: 110px;
        }
        #temucotres {
            top: 770px;
            left: 94px;
        }
        #fnow {
            top: 770px;
            left: 243px;
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