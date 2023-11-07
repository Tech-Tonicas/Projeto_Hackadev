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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('nome');
            $table->string('fabricante');
            $table->text('resumo');
            $table->decimal('preco', 11, 2);
            $table->string('urlImagem');
            //$table->json('imageUrls')->nullable();// Tornando imageUrls opcional
            $table->string('categorias');
            $table->string('cor');
            $table->text('descricao');
           // $table->decimal('avaliacao', 3, 2)->nullable();// Tornando avaliacao opcional
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
