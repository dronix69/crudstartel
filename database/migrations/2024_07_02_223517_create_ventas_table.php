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
        Schema::create('ventas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('matricula_id')->constrained('matriculas')->cascadeOnDelete();
            $table->string('nombre');
            $table->string('apellido');
            $table->integer('boleta')->unique();
            $table->string('forma_pago');
            $table->date('fecha_pago');
            $table->integer('cuota');
            $table->decimal('valor',10,2);
            $table->decimal('total',10,2);
            $table->boolean('cancelado')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ventas');
    }
};
