<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAlunoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('aluno', function (Blueprint $table) {
            $table->foreign(['turma_turm_id'], 'FK_7dkxvmvikn17q78r35w1odj7q')->references(['turm_id'])->on('turma');
            $table->foreign(['pessoa_pess_id'], 'FK_ai5syhs7i5hit0uifd43a4qje')->references(['pess_id'])->on('pessoa');
            $table->foreign(['escola_esc_id'], 'FK_8lki430ac35iaf284bhyll6xj')->references(['esc_id'])->on('escola');
            $table->foreign(['entidade_enti_id'], 'FK_kbjdu10dy3f1mmvnruhhnbmbi')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('aluno', function (Blueprint $table) {
            $table->dropForeign('FK_7dkxvmvikn17q78r35w1odj7q');
            $table->dropForeign('FK_ai5syhs7i5hit0uifd43a4qje');
            $table->dropForeign('FK_8lki430ac35iaf284bhyll6xj');
            $table->dropForeign('FK_kbjdu10dy3f1mmvnruhhnbmbi');
        });
    }
}
