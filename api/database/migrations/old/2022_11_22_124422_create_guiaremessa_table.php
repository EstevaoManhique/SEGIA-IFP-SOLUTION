<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGuiaremessaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('guiaremessa', function (Blueprint $table) {
            $table->integer('guia_id', true);
            $table->boolean('encrypted');
            $table->dateTime('guia_data')->nullable();
            $table->dateTime('guia_dataAprovacao')->nullable();
            $table->string('guia_designado')->nullable();
            $table->longText('guia_detalhes')->nullable();
            $table->string('guia_documento')->nullable();
            $table->bigInteger('guia_numeroLancamento');
            $table->string('guia_referencia')->nullable();
            $table->string('guia_status')->nullable();
            $table->string('guia_tipo')->nullable();
            $table->integer('cliente_clie_id')->nullable()->index('FK_2ccv55iw83bna0crobsh1xcxw');
            $table->integer('entidade_enti_id')->nullable()->index('FK_o9jkf50bybenc11pbgs2wofgs');
            $table->integer('factura_fact_id')->nullable()->index('FK_l4exrkq98om6k1mhr9k688uls');
            $table->integer('fornecedor_for_id')->nullable()->index('FK_fgm9y04ssd5yjyvd3r8e9kcog');
            $table->integer('usuario_usua_id')->nullable()->index('FK_l40btg65x6s39xpu7f6q3ojsq');
            $table->integer('usuario2_usua_id')->nullable()->index('FK_3pa1ddgb0c6u7r5o3jcpn7jw9');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('guiaremessa');
    }
}
