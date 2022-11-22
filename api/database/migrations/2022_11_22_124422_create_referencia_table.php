<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReferenciaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('referencia', function (Blueprint $table) {
            $table->integer('ref_id', true);
            $table->integer('ref_adenda');
            $table->string('ref_ano')->nullable();
            $table->integer('ref_banco');
            $table->integer('ref_bordos');
            $table->integer('ref_budget');
            $table->integer('ref_cliente');
            $table->integer('ref_compras');
            $table->integer('ref_contrato');
            $table->integer('ref_curso');
            $table->integer('ref_deposito');
            $table->integer('ref_despesa');
            $table->integer('ref_diario');
            $table->integer('ref_disciplina');
            $table->integer('ref_docente');
            $table->integer('ref_documento');
            $table->string('ref_entidade')->nullable();
            $table->integer('ref_estudante');
            $table->integer('ref_estudanteAprovacoes');
            $table->integer('ref_estudanteDispensas');
            $table->integer('ref_estudanteExclusoes');
            $table->integer('ref_estudanteReprovacoes');
            $table->integer('ref_extractoCliente');
            $table->integer('ref_extractoStockArtigo');
            $table->integer('ref_extractoStockGeral');
            $table->integer('ref_factura');
            $table->integer('ref_facturaProForma');
            $table->integer('ref_faltas');
            $table->integer('ref_faltasJustificadas');
            $table->integer('ref_fecho');
            $table->integer('ref_fornecedor');
            $table->integer('ref_funcionario');
            $table->integer('ref_guia');
            $table->integer('ref_guiaAbate');
            $table->integer('ref_guiaEntrada');
            $table->integer('ref_guiaRemessa');
            $table->integer('ref_inscricoes');
            $table->integer('ref_lancamento');
            $table->integer('ref_lembrete');
            $table->integer('ref_movimento');
            $table->integer('ref_notaCredito');
            $table->integer('ref_notaDebito');
            $table->integer('ref_pagamento');
            $table->integer('ref_pagamentos');
            $table->integer('ref_pety');
            $table->integer('ref_petycash');
            $table->integer('ref_processamento');
            $table->integer('ref_recibo');
            $table->integer('ref_reciboPagamento');
            $table->integer('ref_requisicao');
            $table->integer('ref_requisicaoCheque');
            $table->integer('ref_salario');
            $table->integer('ref_turma');
            $table->integer('ref_vendaDinheiro');
            $table->integer('ref_vendas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('referencia');
    }
}
