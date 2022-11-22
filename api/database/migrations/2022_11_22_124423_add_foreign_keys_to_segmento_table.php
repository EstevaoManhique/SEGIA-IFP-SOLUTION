<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToSegmentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('segmento', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_nake4dksuegpookjkt7yi7bk2')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('segmento', function (Blueprint $table) {
            $table->dropForeign('FK_nake4dksuegpookjkt7yi7bk2');
        });
    }
}
