<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRequisicaochequeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('requisicaocheque', function (Blueprint $table) {
            $table->integer('rqc_id', true);
            $table->boolean('encrypted');
            $table->string('rpc_beneficiario')->nullable();
            $table->string('rpc_criterio')->nullable();
            $table->longText('rpc_descricao')->nullable();
            $table->string('rpc_movimento')->nullable();
            $table->dateTime('rqc_data')->nullable();
            $table->string('rqc_nrCheque')->nullable();
            $table->string('rqc_serie')->nullable();
            $table->double('rqc_valor');
            $table->longText('rqc_valorExtenso')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_78crg2eren4brq6s86t1mfk1g');
            $table->integer('funcionario_func_id')->nullable()->index('FK_368l0h722rhcf58hyaodn7v70');
            $table->integer('tipoMovimentoCheque_tmc_id')->nullable()->index('FK_sfn6anbmwqw1g12vn474lgr3w');
            $table->integer('usuario_usua_id')->nullable()->index('FK_hqdc0yqgj4xhim1y67130pu1b');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('requisicaocheque');
    }
}
