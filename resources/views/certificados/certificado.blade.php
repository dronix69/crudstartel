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
            top: 264px;
            left: 307px;
            font-size: 24px;
            font-weight: bold;
        }
        #escuela {
            top: 291px;
            left: 209px;
        }
        #rut {
            top: 291px;
            left: 583px;
        }
        #belloun {
            top: 315px;
            left: 268px;
        }
        #tenun {
            top: 343px;
            left: 185px;
        }
        #novena {
            top: 343px;
            left: 602px;
        }
        #codun {
            top: 374px;
            left: 421px;
        }
        #fecun {
            top: 374px;
            left: 583px;
        }
        #codos {
            top: 402px;
            left: 445px;
        }
        #fecdo {
            top: 402px;
            left: 591px;
        }
        #nombre {
            top: 512px;
            left: 181px;
            font-size: 22px;
            font-weight: bold;
        }
        #rutal {
            top: 539px;
            left: 146px;
        }
        #curso {
            top: 571px;
            left: 618px;
        }
        #sit {
            top: 622px;
            left: 272px;
        }
        #novenan {
            top: 657px;
            left: 598px;
        }
        #bellom {
            top: 681px;
            left: 228px;
        }
        #temuco {
            top: 709px;
            left: 224px;
        }
        #novenatre {
            top: 709px;
            left: 598px;
        }
        #codigo {
            top: 732px;
            left: 220px;
        }
        #finicio {
            top: 732px;
            left: 520px;
        }
        #ftermino {
            top: 732px;
            left: 634px;
        }
        #jorge {
            top: 815px;
            left: 177px;
        }
        #jorgerut {
            top: 846px;
            left: 165px;
        }
        #temucotres {
            top: 1047px;
            left: 98px;
        }
        #fnow {
            top: 1047px;
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