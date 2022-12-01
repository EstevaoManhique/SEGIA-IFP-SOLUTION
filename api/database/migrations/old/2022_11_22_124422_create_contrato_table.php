<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContratoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contrato', function (Blueprint $table) {
            $table->integer('cont_id', true);
            $table->dateTime('cont_data')->nullable();
            $table->dateTime('cont_dataConclusao')->nullable();
            $table->dateTime('cont_dataEntrega')->nullable();
            $table->dateTime('cont_dataVisto')->nullable();
            $table->longText('cont_descricao')->nullable();
            $table->longText('cont_empreteiro')->nullable();
            $table->double('cont_execucaoFinanceira');
            $table->integer('cont_execucaoFisica');
            $table->longText('cont_fonteFinacimento')->nullable();
            $table->string('cont_gestor')->nullable();
            $table->longText('cont_link')->nullable();
            $table->longText('cont_linkVisto')->nullable();
            $table->longText('cont_observacoes')->nullable();
            $table->string('cont_referencia')->nullable();
            $table->string('cont_referencia_2')->nullable();
            $table->string('cont_tipoVisto')->nullable();
            $table->double('cont_valor');
            $table->double('cont_valorExecutar');
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_ai16kqg1fsg5a9lx2hjtm132u');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contrato');
    }
}
