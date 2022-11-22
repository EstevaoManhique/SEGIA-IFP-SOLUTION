<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToFluxoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('fluxo', function (Blueprint $table) {
            $table->foreign(['turma_turm_id'], 'FK_rxxvlgty2vwtusi5mlulpppfe')->references(['turm_id'])->on('turma');
            $table->foreign(['cliente_clie_id'], 'FK_1yk8x0ntt12sso9u5yfnei4gf')->references(['clie_id'])->on('cliente');
            $table->foreign(['usuario_usua_id'], 'FK_9888de7hay47qg0yhagmnx41')->references(['usua_id'])->on('usuario');
            $table->foreign(['factura_fact_id'], 'FK_rx18ia004wj6jp8urmvwfsgkk')->references(['fact_id'])->on('factura');
            $table->foreign(['entidade_enti_id'], 'FK_932fvs2xhjy0ebqf552vry3c8')->references(['enti_id'])->on('entidade');
            $table->foreign(['produto_pro_id'], 'FK_oq56wted8d2j7ltb1u1bjfvon')->references(['pro_id'])->on('produto');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('fluxo', function (Blueprint $table) {
            $table->dropForeign('FK_rxxvlgty2vwtusi5mlulpppfe');
            $table->dropForeign('FK_1yk8x0ntt12sso9u5yfnei4gf');
            $table->dropForeign('FK_9888de7hay47qg0yhagmnx41');
            $table->dropForeign('FK_rx18ia004wj6jp8urmvwfsgkk');
            $table->dropForeign('FK_932fvs2xhjy0ebqf552vry3c8');
            $table->dropForeign('FK_oq56wted8d2j7ltb1u1bjfvon');
        });
    }
}
