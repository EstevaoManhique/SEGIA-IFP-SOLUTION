<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToTurmaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('turma', function (Blueprint $table) {
            $table->foreign(['escola_esc_id'], 'FK_5qqkdoye2cw1blidt4815bg4i')->references(['esc_id'])->on('escola');
            $table->foreign(['entidade_enti_id'], 'FK_elqbpy4e3ei8gxuwmd600mlnm')->references(['enti_id'])->on('entidade');
            $table->foreign(['sala_sala_id'], 'FK_r1eadv9h70hlo5gaeci57t604')->references(['sala_id'])->on('sala');
            $table->foreign(['anoLectivo_anol_id'], 'FK_bjtfwyhokopn8tmrlagm7g9u5')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['curso_curs_id'], 'FK_f0slo7hicixq14ep3d30x3ncn')->references(['curs_id'])->on('curso');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('turma', function (Blueprint $table) {
            $table->dropForeign('FK_5qqkdoye2cw1blidt4815bg4i');
            $table->dropForeign('FK_elqbpy4e3ei8gxuwmd600mlnm');
            $table->dropForeign('FK_r1eadv9h70hlo5gaeci57t604');
            $table->dropForeign('FK_bjtfwyhokopn8tmrlagm7g9u5');
            $table->dropForeign('FK_f0slo7hicixq14ep3d30x3ncn');
        });
    }
}
