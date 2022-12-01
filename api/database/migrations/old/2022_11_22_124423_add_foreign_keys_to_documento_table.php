<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToDocumentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('documento', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_7nn20ephejebgdiqa7nefaggt')->references(['enti_id'])->on('entidade');
            $table->foreign(['entidade_enti_id'], 'FK_kmtl648ennkv78qmqmk4xa46u')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('documento', function (Blueprint $table) {
            $table->dropForeign('FK_7nn20ephejebgdiqa7nefaggt');
            $table->dropForeign('FK_kmtl648ennkv78qmqmk4xa46u');
        });
    }
}
