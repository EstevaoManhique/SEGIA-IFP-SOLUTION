<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDespesaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('despesa', function (Blueprint $table) {
            $table->integer('desp_id', true);
            $table->boolean('desp_aCredito');
            $table->dateTime('desp_data')->nullable();
            $table->string('desp_descricao')->nullable();
            $table->string('desp_fornecedor')->nullable();
            $table->bigInteger('desp_nrDocumento');
            $table->bigInteger('desp_nuit');
            $table->integer('desp_numeroRequisicoes');
            $table->string('desp_referencia')->nullable();
            $table->string('desp_status')->nullable();
            $table->double('desp_valor');
            $table->double('desp_valorExecutado');
            $table->double('desp_valorPago');
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_ix6fw0l8nm6vwwdxgs9s12wi1');
            $table->integer('tipoDespesa_tipd_id')->nullable()->index('FK_ob59rwsh7ee50cnugp7xckkri');
            $table->integer('usuario_usua_id')->nullable()->index('FK_jhsaoifwu41688cg6seyh6ybr');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('despesa');
    }
}
