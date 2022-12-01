<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToExameTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('exame', function (Blueprint $table) {
            $table->foreign(['anoLectivo_anol_id'], 'FK_ohlqhdvrnddsfac8yrvrj6k8h')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['disciplina_disc_id'], 'FK_6cn7ybgwypslpusof4jfmafr5')->references(['disc_id'])->on('disciplina');
            $table->foreign(['aluno_alun_id'], 'FK_7fp9b02gfuj5ihrpned1qdie5')->references(['alun_id'])->on('aluno');
            $table->foreign(['inscricao_insc_id'], 'FK_hypknfacmlg2muescafsxjx0y')->references(['insc_id'])->on('inscricao');
            $table->foreign(['salaExame_salae_id'], 'FK_6yr3292ylfg9uues9k28edlrf')->references(['salae_id'])->on('salaexame');
            $table->foreign(['entidade_enti_id'], 'FK_ao14u1oumwx3su9r6f3mg3tca')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('exame', function (Blueprint $table) {
            $table->dropForeign('FK_ohlqhdvrnddsfac8yrvrj6k8h');
            $table->dropForeign('FK_6cn7ybgwypslpusof4jfmafr5');
            $table->dropForeign('FK_7fp9b02gfuj5ihrpned1qdie5');
            $table->dropForeign('FK_hypknfacmlg2muescafsxjx0y');
            $table->dropForeign('FK_6yr3292ylfg9uues9k28edlrf');
            $table->dropForeign('FK_ao14u1oumwx3su9r6f3mg3tca');
        });
    }
}
