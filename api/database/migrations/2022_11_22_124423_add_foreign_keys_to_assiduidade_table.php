<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAssiduidadeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('assiduidade', function (Blueprint $table) {
            $table->foreign(['pessoa_pess_id'], 'FK_knqx8leyqvxp3an5btor1s5sw')->references(['pess_id'])->on('pessoa');
            $table->foreign(['Entidade_enti_id'], 'FK_taej257uv67ps6ht9rdou3s45')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('assiduidade', function (Blueprint $table) {
            $table->dropForeign('FK_knqx8leyqvxp3an5btor1s5sw');
            $table->dropForeign('FK_taej257uv67ps6ht9rdou3s45');
        });
    }
}
