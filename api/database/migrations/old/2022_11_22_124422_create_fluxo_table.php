<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFluxoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fluxo', function (Blueprint $table) {
            $table->integer('flux_id', true);
            $table->boolean('encrypted');
            $table->double('flux_custoVenda');
            $table->dateTime('flux_data')->nullable();
            $table->longText('flux_descricao')->nullable();
            $table->integer('flux_qtd');
            $table->integer('flux_qtdPresente');
            $table->string('flux_referenciaDocumento')->nullable();
            $table->string('flux_tipo')->nullable();
            $table->string('flux_tipoVenda')->nullable();
            $table->integer('flux_ultimoStock');
            $table->integer('cliente_clie_id')->nullable()->index('FK_1yk8x0ntt12sso9u5yfnei4gf');
            $table->integer('entidade_enti_id')->nullable()->index('FK_932fvs2xhjy0ebqf552vry3c8');
            $table->integer('factura_fact_id')->nullable()->index('FK_rx18ia004wj6jp8urmvwfsgkk');
            $table->integer('produto_pro_id')->nullable()->index('FK_oq56wted8d2j7ltb1u1bjfvon');
            $table->integer('turma_turm_id')->nullable()->index('FK_rxxvlgty2vwtusi5mlulpppfe');
            $table->integer('usuario_usua_id')->nullable()->index('FK_9888de7hay47qg0yhagmnx41');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('fluxo');
    }
}
