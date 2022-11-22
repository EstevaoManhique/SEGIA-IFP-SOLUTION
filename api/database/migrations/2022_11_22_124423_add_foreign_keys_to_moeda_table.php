<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMoedaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('moeda', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_2rnrolstx6iaj0b4vgk0wbjd2')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('moeda', function (Blueprint $table) {
            $table->dropForeign('FK_2rnrolstx6iaj0b4vgk0wbjd2');
        });
    }
}
