<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFacturaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('factura', function (Blueprint $table) {
            $table->integer('fact_id', true);
            $table->boolean('encrypted');
            $table->double('fact_ValorTrocos');
            $table->string('fact_bancoPagamento')->nullable();
            $table->double('fact_cambio');
            $table->string('fact_categorizacao')->nullable();
            $table->string('fact_condicaoPagamento')->nullable();
            $table->dateTime('fact_data')->nullable();
            $table->dateTime('fact_dataLimite')->nullable();
            $table->dateTime('fact_dataPagamento')->nullable();
            $table->double('fact_desconto');
            $table->double('fact_descontoFinaceiro');
            $table->string('fact_documentoPagamento')->nullable();
            $table->string('fact_documentoReferencia')->nullable();
            $table->boolean('fact_emitida');
            $table->boolean('fact_emitidoRecibo');
            $table->string('fact_item')->nullable();
            $table->boolean('fact_iva');
            $table->boolean('fact_lancada');
            $table->longText('fact_motivoIsencao')->nullable();
            $table->string('fact_nrDocumentoPagamento')->nullable();
            $table->bigInteger('fact_numerocartao');
            $table->bigInteger('fact_numerolancamento');
            $table->longText('fact_observacoes')->nullable();
            $table->string('fact_origem')->nullable();
            $table->integer('fact_pedidoCliente');
            $table->integer('fact_prestacoes');
            $table->integer('fact_prestacoesPagas');
            $table->boolean('fact_reciboProcessado');
            $table->string('fact_referencia')->nullable();
            $table->string('fact_referenciaRecibo')->nullable();
            $table->string('fact_requisicao')->nullable();
            $table->string('fact_status')->nullable();
            $table->string('fact_tipo')->nullable();
            $table->double('fact_valorIncidencia');
            $table->double('fact_valorMulta');
            $table->double('fact_valorPago');
            $table->double('fact_valorProcessado');
            $table->double('fact_valorRecibo');
            $table->double('fact_valorTotalMedio');
            $table->double('fact_valoriva');
            $table->double('fact_valortotal');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_l9cu83u86jv7swv2sayt2066h');
            $table->integer('caixa_caix_id')->nullable()->index('FK_btj7lhcqrg4kcqtq1nn9x0d6w');
            $table->integer('conta_ctg_id')->nullable()->index('FK_n9q1itic7w1m80i9fksj1f7ed');
            $table->integer('documento_doc_id')->nullable()->index('FK_3hvhu0mt8vrm460rsarcjgn9d');
            $table->integer('moeda_moe_id')->nullable()->index('FK_f2ubmtdurx6mjqagc9ibcab8d');
            $table->integer('pagamento_pag_id')->nullable()->index('FK_158uv0y880xxre18kwkayp4lp');
            $table->integer('usuario_usua_id')->nullable()->index('FK_a70gyxw3dru3i5yrb6k17e9xq');
            $table->integer('venda_vend_id')->nullable()->index('FK_h7f67f4gdqlmkc705e397fy8a');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('factura');
    }
}
