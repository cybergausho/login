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
        Schema::create('escuelas', function (Blueprint $table) {
                $table->id();
                $table->string('cuatrigrama')->unique();
                $table->string('nombre');
                $table->string('telefono');
                $table->string('email');
                $table->integer('provincia')->nullable();
                $table->integer('localidad')->nullable();
                $table->string('maps')->nullable();
                $table->boolean('estado')->nullable();
                $table->timestamps();
            });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('escuelas');
    }
};
