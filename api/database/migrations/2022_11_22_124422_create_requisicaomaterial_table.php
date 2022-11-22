<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRequisicaomaterialTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('requisicaomaterial', function (Blueprint $table) {
            $table->integer('reqm_id', true);
            $table->boolean('encrypted');
            $table->dateTime('reqm_data')->nullable();
            $table->dateTime('reqm_dataAlteracao')->nullable();
            $table->dateTime('reqm_dataAprovacao')->nullable();
            $table->longText('reqm_descricao')->nullable();
            $table->string('reqm_documento')->nullable();
            $table->longText('reqm_observacoes')->nullable();
            $table->string('reqm_referencia')->nullable();
            $table->string('reqm_status')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_hliqklmlo1051ejs8cn1tmvx5');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_8quo3tfx7cfk17w30t3rmg1m1');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('requisicaomaterial');
    }
}
