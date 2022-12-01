<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToCalendarioexameTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('calendarioexame', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_3x7p6epyknjn2jfceuqjcgvi7')->references(['enti_id'])->on('entidade');
            $table->foreign(['curso_curs_id'], 'FK_ucqb3a5culx0xu4gbmv07eta')->references(['curs_id'])->on('curso');
            $table->foreign(['anoLectivo_anol_id'], 'FK_rvd5vqdpebu392hsuw6bmismo')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['disciplina_disc_id'], 'FK_wuumfdmtmy08penr2x2gsvnf')->references(['disc_id'])->on('disciplina');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('calendarioexame', function (Blueprint $table) {
            $table->dropForeign('FK_3x7p6epyknjn2jfceuqjcgvi7');
            $table->dropForeign('FK_ucqb3a5culx0xu4gbmv07eta');
            $table->dropForeign('FK_rvd5vqdpebu392hsuw6bmismo');
            $table->dropForeign('FK_wuumfdmtmy08penr2x2gsvnf');
        });
    }
}
