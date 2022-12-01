<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCategoriaprodutoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('categoriaproduto', function (Blueprint $table) {
            $table->integer('catp_id', true);
            $table->string('catp_codigo')->nullable();
            $table->string('catp_descricao')->nullable();
            $table->boolean('catp_estocado');
            $table->integer('catp_numeroArtigos');
            $table->integer('catp_referenciaArtigos');
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_56q3cja2toqw8xna7maeddhox');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('categoriaproduto');
    }
}
