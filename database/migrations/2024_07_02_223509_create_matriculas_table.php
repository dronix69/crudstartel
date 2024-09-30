<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('matriculas', function (Blueprint $table) {
            $table->id();
            $table->string('nombre');
            $table->string('apellido');
            $table->string('rut')->unique();
            $table->string('correo')->unique();
            $table->integer('telefono');
            $table->integer('edad');
            $table->date('fecha_matricula');
            $table->date('fecha_nacimiento');
            $table->string('direccion');
            $table->string('comuna');
            $table->string('codigo');
            $table->string('nivel');
            $table->string('licencia_actual');


            $table->foreignId('cursos_id')
                ->constrained('cursos')
                ->cascadeOnUpdate()
                ->cascadeOnDelete();

            $table->string('image_url')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('matriculas');
    }
};
