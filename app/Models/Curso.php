<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Curso extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function certificado()
    {
        return $this->hasOne(Certificado::class, 'id');
    }

    public function matriculas()
    {
        return $this->hasMany(Matricula::class);
    }
}
