<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateActivoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('activo', function (Blueprint $table) {
            $table->integer('acti_id', true);
            $table->dateTime('acti_data')->nullable();
            $table->longText('acti_descricao')->nullable();
            $table->longText('acti_especificacoes')->nullable();
            $table->string('acti_referenciaDocumentoCompra')->nullable();
            $table->double('acti_valor');
            $table->integer('acti_vidaUtil');
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_rp47hp38awi1fpqoc4ebmp5qp');
            $table->integer('fornecedor_for_id')->nullable()->index('FK_c7i9rp55yxtixj2ofssn83vne');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('activo');
    }
}
