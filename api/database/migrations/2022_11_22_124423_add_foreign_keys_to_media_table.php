<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMediaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('media', function (Blueprint $table) {
            $table->foreign(['anoLectivo_anol_id'], 'FK_syeeo0owc0kpoi63pms4jncrq')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['entidade_enti_id'], 'FK_24j3ky0oiyqrnbb6njf1hcvcj')->references(['enti_id'])->on('entidade');
            $table->foreign(['aluno_alun_id'], 'FK_a5y2kmp2d4ps55ejivqqxkq4q')->references(['alun_id'])->on('aluno');
            $table->foreign(['inscricao_insc_id'], 'FK_ie7tc2p7ppkh5r56t09ydlkfm')->references(['insc_id'])->on('inscricao');
            $table->foreign(['disciplina_disc_id'], 'FK_8c1otoe3gpk18icphq8m7swwq')->references(['disc_id'])->on('disciplina');
            $table->foreign(['turma_turm_id'], 'FK_dq9itvdjwejv4xxe58gdxckd4')->references(['turm_id'])->on('turma');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('media', function (Blueprint $table) {
            $table->dropForeign('FK_syeeo0owc0kpoi63pms4jncrq');
            $table->dropForeign('FK_24j3ky0oiyqrnbb6njf1hcvcj');
            $table->dropForeign('FK_a5y2kmp2d4ps55ejivqqxkq4q');
            $table->dropForeign('FK_ie7tc2p7ppkh5r56t09ydlkfm');
            $table->dropForeign('FK_8c1otoe3gpk18icphq8m7swwq');
            $table->dropForeign('FK_dq9itvdjwejv4xxe58gdxckd4');
        });
    }
}
