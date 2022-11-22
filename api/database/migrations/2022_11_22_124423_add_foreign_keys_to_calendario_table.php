<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToCalendarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('calendario', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_9fgbiary8onfif286f2ykm8lg')->references(['enti_id'])->on('entidade');
            $table->foreign(['juri1_doce_id'], 'FK_gccsrxn9qkuasrga6x1v4obmr')->references(['doce_id'])->on('docente');
            $table->foreign(['anoLectivo_anol_id'], 'FK_32uujplvdhlrg5oa979oq5vdu')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['curso_curs_id'], 'FK_ry23c7th8hjprj2ef7k0w52qv')->references(['curs_id'])->on('curso');
            $table->foreign(['turma_turm_id'], 'FK_74odnvyv7w55sfw52tffsoqlw')->references(['turm_id'])->on('turma');
            $table->foreign(['disciplina_disc_id'], 'FK_98mxa2b9760hj8sv2187uahnh')->references(['disc_id'])->on('disciplina');
            $table->foreign(['juri4_doce_id'], 'FK_e6po33lyxud6bv0671pmpxejw')->references(['doce_id'])->on('docente');
            $table->foreign(['juri3_doce_id'], 'FK_mwds2x932u8pnkos7j8veq0oo')->references(['doce_id'])->on('docente');
            $table->foreign(['docente_doce_id'], 'FK_5g188ca99e6q7hhbpjikw6tta')->references(['doce_id'])->on('docente');
            $table->foreign(['juri2_doce_id'], 'FK_7746ft7hog9q6i39bh1m3ffvc')->references(['doce_id'])->on('docente');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('calendario', function (Blueprint $table) {
            $table->dropForeign('FK_9fgbiary8onfif286f2ykm8lg');
            $table->dropForeign('FK_gccsrxn9qkuasrga6x1v4obmr');
            $table->dropForeign('FK_32uujplvdhlrg5oa979oq5vdu');
            $table->dropForeign('FK_ry23c7th8hjprj2ef7k0w52qv');
            $table->dropForeign('FK_74odnvyv7w55sfw52tffsoqlw');
            $table->dropForeign('FK_98mxa2b9760hj8sv2187uahnh');
            $table->dropForeign('FK_e6po33lyxud6bv0671pmpxejw');
            $table->dropForeign('FK_mwds2x932u8pnkos7j8veq0oo');
            $table->dropForeign('FK_5g188ca99e6q7hhbpjikw6tta');
            $table->dropForeign('FK_7746ft7hog9q6i39bh1m3ffvc');
        });
    }
}
