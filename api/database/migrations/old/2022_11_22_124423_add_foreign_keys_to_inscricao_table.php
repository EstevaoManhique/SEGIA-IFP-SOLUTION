<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToInscricaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('inscricao', function (Blueprint $table) {
            $table->foreign(['turno_turn_id'], 'FK_yuw9jl6rvbeahytnik5cgh4q')->references(['turn_id'])->on('turno');
            $table->foreign(['turma_turm_id'], 'FK_96ffud0y1ccfyvcwkq1366cn8')->references(['turm_id'])->on('turma');
            $table->foreign(['entidade_enti_id'], 'FK_bowie4p725a210no3ukjgtxxi')->references(['enti_id'])->on('entidade');
            $table->foreign(['aluno_alun_id'], 'FK_s1nuxyfeo8b80m8ni7by9kikr')->references(['alun_id'])->on('aluno');
            $table->foreign(['anoLectivo_anol_id'], 'FK_9erfl299rv2wy5n2cp0fn9ks0')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['curso_curs_id'], 'FK_gx178uqpqdb0i87lukjifj3nl')->references(['curs_id'])->on('curso');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('inscricao', function (Blueprint $table) {
            $table->dropForeign('FK_yuw9jl6rvbeahytnik5cgh4q');
            $table->dropForeign('FK_96ffud0y1ccfyvcwkq1366cn8');
            $table->dropForeign('FK_bowie4p725a210no3ukjgtxxi');
            $table->dropForeign('FK_s1nuxyfeo8b80m8ni7by9kikr');
            $table->dropForeign('FK_9erfl299rv2wy5n2cp0fn9ks0');
            $table->dropForeign('FK_gx178uqpqdb0i87lukjifj3nl');
        });
    }
}
