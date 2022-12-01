<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateItempedidoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('itempedido', function (Blueprint $table) {
            $table->integer('itp_id', true);
            $table->boolean('encrypted');
            $table->string('itp_cod')->nullable();
            $table->double('itp_custoVenda');
            $table->dateTime('itp_data')->nullable();
            $table->double('itp_desconto');
            $table->longText('itp_descricao')->nullable();
            $table->double('itp_iva');
            $table->double('itp_precoIva');
            $table->double('itp_precoIvaMedio');
            $table->double('itp_precoMedio');
            $table->double('itp_precoTotal');
            $table->double('itp_precoTotalMedio');
            $table->double('itp_precoUnit');
            $table->integer('itp_quantidade');
            $table->integer('itp_refProduto');
            $table->string('itp_referencia')->nullable();
            $table->bigInteger('itp_referenciaFactura');
            $table->string('itp_referenciaGuia')->nullable();
            $table->string('itp_tipoVenda')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_m6m2s7nhn25qfgodw35mi4ksr');
            $table->integer('factura_fact_id')->nullable()->index('FK_gcnldac310v1ro23xsngeq89');
            $table->integer('guiaRemessa_guia_id')->nullable()->index('FK_5gafq0bq1ce9j0mlo6436y6hk');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('itempedido');
    }
}
