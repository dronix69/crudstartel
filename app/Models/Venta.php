<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Venta extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function matricula()
    {
        return $this->belongsTo(Matricula::class);
    }

    public function certificado()
    {
        return $this->hasOne(Certificado::class, 'id');
    }

   


}
