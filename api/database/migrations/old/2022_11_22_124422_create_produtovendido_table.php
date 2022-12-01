<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProdutovendidoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('produtovendido', function (Blueprint $table) {
            $table->integer('prv_id', true);
            $table->double('prv_ajuste');
            $table->double('prv_custoVenda');
            $table->dateTime('prv_data')->nullable();
            $table->double('prv_desconto');
            $table->longText('prv_descricao')->nullable();
            $table->double('prv_iva');
            $table->double('prv_precoCusto');
            $table->double('prv_precoMedio');
            $table->integer('prv_qtd');
            $table->string('prv_referencia')->nullable();
            $table->string('prv_tipoVenda')->nullable();
            $table->double('prv_total');
            $table->double('prv_totalIva');
            $table->double('prv_totalIvaMedio');
            $table->double('prv_totalPrecoMedio');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_1qfvgbf47f67lm1qe141li2w');
            $table->integer('factura_fact_id')->nullable()->index('FK_fd71ro974t7t11hmtn5tmcf6r');
            $table->integer('produto_pro_id')->nullable()->index('FK_bvo0424p1lwo9u8ri6oxcykry');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('produtovendido');
    }
}
