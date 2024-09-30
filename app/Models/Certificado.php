<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Certificado extends Model
{
    use HasFactory;

    protected $guarded = [];

    

    public function venta()
    {
        return $this->belongsTo(Venta::class, 'venta_id');
    }

    public function curso()
    {
        return $this->belongsTo(Curso::class, 'curso_id');
    }

    // codigo para formatear fechas al español en mi certificado.blade.php
    public function getFechaIniFormateadaAttribute()
    {
        return Carbon::parse($this->fecha_ini)->locale('es')->isoFormat('D [de] MMMM [de] YYYY');
    }

    public function getFechaFinFormateadaAttribute()
    {
        return Carbon::parse($this->fecha_fin)->locale('es')->isoFormat('D [de] MMMM [de] YYYY');
    }

    public function getFechaOtorgadoFormateadaAttribute()
    {
        return Carbon::parse($this->fecha_otorgado)->locale('es')->isoFormat('D [de] MMMM [de] YYYY');
    }
}
