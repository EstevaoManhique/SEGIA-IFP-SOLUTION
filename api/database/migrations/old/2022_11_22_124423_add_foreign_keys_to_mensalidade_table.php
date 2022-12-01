<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMensalidadeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('mensalidade', function (Blueprint $table) {
            $table->foreign(['aluno_alun_id'], 'FK_4vprncqyqt1w7rcsqd809l8so')->references(['alun_id'])->on('aluno');
            $table->foreign(['curso_curs_id'], 'FK_rq9ygnvbbk6etbp9awc9kstfu')->references(['curs_id'])->on('curso');
            $table->foreign(['entidade_enti_id'], 'FK_55drx7a8y9d0yjxfmivwcqxqj')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('mensalidade', function (Blueprint $table) {
            $table->dropForeign('FK_4vprncqyqt1w7rcsqd809l8so');
            $table->dropForeign('FK_rq9ygnvbbk6etbp9awc9kstfu');
            $table->dropForeign('FK_55drx7a8y9d0yjxfmivwcqxqj');
        });
    }
}
