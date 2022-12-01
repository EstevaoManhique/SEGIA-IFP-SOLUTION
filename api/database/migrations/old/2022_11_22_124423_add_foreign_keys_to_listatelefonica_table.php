<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToListatelefonicaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('listatelefonica', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_gmjl77s4abl5s2w1ldn62necl')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('listatelefonica', function (Blueprint $table) {
            $table->dropForeign('FK_gmjl77s4abl5s2w1ldn62necl');
        });
    }
}
