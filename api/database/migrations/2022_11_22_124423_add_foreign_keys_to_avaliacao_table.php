<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAvaliacaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('avaliacao', function (Blueprint $table) {
            $table->foreign(['aluno_alun_id'], 'FK_avqgkwb66f9siw8injhgo9nhl')->references(['alun_id'])->on('aluno');
            $table->foreign(['entidade_enti_id'], 'FK_mcyawqa1dsvq17stmpkitaet4')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('avaliacao', function (Blueprint $table) {
            $table->dropForeign('FK_avqgkwb66f9siw8injhgo9nhl');
            $table->dropForeign('FK_mcyawqa1dsvq17stmpkitaet4');
        });
    }
}
