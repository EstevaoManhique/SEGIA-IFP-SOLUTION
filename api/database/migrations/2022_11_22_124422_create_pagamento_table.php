<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePagamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pagamento', function (Blueprint $table) {
            $table->integer('pag_id', true);
            $table->boolean('encrypted');
            $table->boolean('online');
            $table->boolean('pag_actual');
            $table->string('pag_categorizacao')->nullable();
            $table->double('pag_comissao');
            $table->string('pag_condicao')->nullable();
            $table->dateTime('pag_data')->nullable();
            $table->dateTime('pag_dataLimite')->nullable();
            $table->dateTime('pag_dataPagamento')->nullable();
            $table->string('pag_descricao')->nullable();
            $table->string('pag_estado')->nullable();
            $table->string('pag_formaPagamento')->nullable();
            $table->double('pag_multa');
            $table->string('pag_origem')->nullable();
            $table->string('pag_periodo')->nullable();
            $table->string('pag_recibo')->nullable();
            $table->string('pag_refElectronico')->nullable();
            $table->string('pag_refOnline')->nullable();
            $table->string('pag_referencia')->nullable();
            $table->boolean('pag_status');
            $table->double('pag_valor');
            $table->double('pag_valorPago');
            $table->integer('caixa_caix_id')->nullable()->index('FK_3idshtgvh2x3c7xqp8e28govb');
            $table->integer('entidade_enti_id')->nullable()->index('FK_4hjbtodk3l25mgwmf53nsg9kf');
            $table->integer('inscricao_insc_id')->nullable()->index('FK_1kd8i3l96jcb8q95oo4m5chy3');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_peu87n5vy56271rmp1ca1n8rx');
            $table->integer('reciboPagamento_recp_id')->nullable()->index('FK_lyevni07eq966mcvq9mkkk25v');
            $table->integer('turma_turm_id')->nullable()->index('FK_2npd64r3pm1bfeo5okvtkqeud');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pagamento');
    }
}
