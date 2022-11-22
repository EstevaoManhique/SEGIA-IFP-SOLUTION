<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToNotasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('notas', function (Blueprint $table) {
            $table->foreign(['anoLectivo_anol_id'], 'FK_npauu1jp16y8ynvkx1gxuyp92')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['inscricao_insc_id'], 'FK_1c8qjujjprm04lmiy71pcjrf7')->references(['insc_id'])->on('inscricao');
            $table->foreign(['entidade_enti_id'], 'FK_8tunkwvd1cb5vqhdw500mw2tm')->references(['enti_id'])->on('entidade');
            $table->foreign(['aluno_alun_id'], 'FK_m9xigny2j8ml20pbayewwoxa0')->references(['alun_id'])->on('aluno');
            $table->foreign(['disciplina_disc_id'], 'FK_8pfotl50da7a8bptenacyt172')->references(['disc_id'])->on('disciplina');
            $table->foreign(['turma_turm_id'], 'FK_fe3oe0fg0bqbr3s7itq7qufxc')->references(['turm_id'])->on('turma');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('notas', function (Blueprint $table) {
            $table->dropForeign('FK_npauu1jp16y8ynvkx1gxuyp92');
            $table->dropForeign('FK_1c8qjujjprm04lmiy71pcjrf7');
            $table->dropForeign('FK_8tunkwvd1cb5vqhdw500mw2tm');
            $table->dropForeign('FK_m9xigny2j8ml20pbayewwoxa0');
            $table->dropForeign('FK_8pfotl50da7a8bptenacyt172');
            $table->dropForeign('FK_fe3oe0fg0bqbr3s7itq7qufxc');
        });
    }
}
