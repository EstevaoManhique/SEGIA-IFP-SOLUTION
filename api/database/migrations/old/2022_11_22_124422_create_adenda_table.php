<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdendaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('adenda', function (Blueprint $table) {
            $table->integer('aden_id', true);
            $table->dateTime('aden_data')->nullable();
            $table->dateTime('aden_dataAprovacao')->nullable();
            $table->dateTime('aden_dataAprovacaoRegiao')->nullable();
            $table->dateTime('aden_dataAprovacaoSede')->nullable();
            $table->dateTime('aden_dataJustificativo')->nullable();
            $table->longText('aden_detalhes')->nullable();
            $table->string('aden_link')->nullable();
            $table->string('aden_referencia')->nullable();
            $table->string('aden_status')->nullable();
            $table->double('aden_valor');
            $table->boolean('encrypted');
            $table->integer('contrato_cont_id')->nullable()->index('FK_kanbae4v9j5ibqvb289ghlyh3');
            $table->integer('entidade_enti_id')->nullable()->index('FK_1dcxp4uiuydwbouseceykbg9i');
            $table->integer('usuario_usua_id')->nullable()->index('FK_m0wbiuqlirtddf0q9dkorb72');
            $table->integer('usuario2_usua_id')->nullable()->index('FK_fuf7gv7dx8a2qmym7cgcsvsuq');
            $table->integer('usuario3_usua_id')->nullable()->index('FK_752xlf1p4w319pbpnkrdn3yi1');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('adenda');
    }
}
