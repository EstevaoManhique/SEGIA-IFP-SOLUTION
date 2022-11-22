<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToPagamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('pagamento', function (Blueprint $table) {
            $table->foreign(['pessoa_pess_id'], 'FK_peu87n5vy56271rmp1ca1n8rx')->references(['pess_id'])->on('pessoa');
            $table->foreign(['inscricao_insc_id'], 'FK_1kd8i3l96jcb8q95oo4m5chy3')->references(['insc_id'])->on('inscricao');
            $table->foreign(['caixa_caix_id'], 'FK_3idshtgvh2x3c7xqp8e28govb')->references(['caix_id'])->on('caixa');
            $table->foreign(['reciboPagamento_recp_id'], 'FK_lyevni07eq966mcvq9mkkk25v')->references(['recp_id'])->on('recibopagamento');
            $table->foreign(['turma_turm_id'], 'FK_2npd64r3pm1bfeo5okvtkqeud')->references(['turm_id'])->on('turma');
            $table->foreign(['entidade_enti_id'], 'FK_4hjbtodk3l25mgwmf53nsg9kf')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('pagamento', function (Blueprint $table) {
            $table->dropForeign('FK_peu87n5vy56271rmp1ca1n8rx');
            $table->dropForeign('FK_1kd8i3l96jcb8q95oo4m5chy3');
            $table->dropForeign('FK_3idshtgvh2x3c7xqp8e28govb');
            $table->dropForeign('FK_lyevni07eq966mcvq9mkkk25v');
            $table->dropForeign('FK_2npd64r3pm1bfeo5okvtkqeud');
            $table->dropForeign('FK_4hjbtodk3l25mgwmf53nsg9kf');
        });
    }
}
