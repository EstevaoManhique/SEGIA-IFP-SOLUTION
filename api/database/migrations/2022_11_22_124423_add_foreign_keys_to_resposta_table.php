<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToRespostaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('resposta', function (Blueprint $table) {
            $table->foreign(['curso_curs_id'], 'FK_2q2weqltc8r1nrok80c1ydqq8')->references(['curs_id'])->on('curso');
            $table->foreign(['entidade_enti_id'], 'FK_meoamw39mpd1o6sp7m1dlu0bv')->references(['enti_id'])->on('entidade');
            $table->foreign(['anoLectivo_anol_id'], 'FK_efvyvoswphpmjlxn4lsmvdqlb')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['disciplina_disc_id'], 'FK_mymag3ipaad3ocoat8eqjns87')->references(['disc_id'])->on('disciplina');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('resposta', function (Blueprint $table) {
            $table->dropForeign('FK_2q2weqltc8r1nrok80c1ydqq8');
            $table->dropForeign('FK_meoamw39mpd1o6sp7m1dlu0bv');
            $table->dropForeign('FK_efvyvoswphpmjlxn4lsmvdqlb');
            $table->dropForeign('FK_mymag3ipaad3ocoat8eqjns87');
        });
    }
}
