<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRequisicaofundoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('requisicaofundo', function (Blueprint $table) {
            $table->integer('reqf_id', true);
            $table->boolean('encrypted');
            $table->dateTime('reqf_data')->nullable();
            $table->dateTime('reqf_dataAlteracao')->nullable();
            $table->dateTime('reqf_dataAprovacao')->nullable();
            $table->dateTime('reqf_dataAprovacaoRH')->nullable();
            $table->dateTime('reqf_dataAprovacaoRegiao')->nullable();
            $table->dateTime('reqf_dataAprovacaoSede')->nullable();
            $table->dateTime('reqf_dataJustificativo')->nullable();
            $table->longText('reqf_detalhes')->nullable();
            $table->longText('reqf_link')->nullable();
            $table->longText('reqf_linkJustificativo')->nullable();
            $table->string('reqf_referencia')->nullable();
            $table->string('reqf_segmento')->nullable();
            $table->string('reqf_status')->nullable();
            $table->double('reqf_valor');
            $table->integer('contrato_cont_id')->nullable()->index('FK_tfedl3oltb9o8eovef5efsc66');
            $table->integer('entidade_enti_id')->nullable()->index('FK_8vvou31981olxqv7d40psh6m2');
            $table->integer('usuario_usua_id')->nullable()->index('FK_eolskwf9et44ahtpr0t2nbgad');
            $table->integer('usuario2_usua_id')->nullable()->index('FK_7jqsyys08pv6isl6b7yb9xre0');
            $table->integer('usuario3_usua_id')->nullable()->index('FK_sdwxlng1jw3w633jmrg2oa9ic');
            $table->integer('usuario4_usua_id')->nullable()->index('FK_7a9d4b25td2bijvdrupoxcv2m');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('requisicaofundo');
    }
}
