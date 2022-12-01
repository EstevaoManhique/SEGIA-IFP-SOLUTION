<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToTurnoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('turno', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_na73qssrt3o6lgh71qb320qie')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('turno', function (Blueprint $table) {
            $table->dropForeign('FK_na73qssrt3o6lgh71qb320qie');
        });
    }
}
