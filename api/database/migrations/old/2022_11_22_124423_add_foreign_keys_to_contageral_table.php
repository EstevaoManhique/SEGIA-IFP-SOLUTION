<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToContageralTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('contageral', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_qf5yrej3obl5admbo3k1c50gu')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('contageral', function (Blueprint $table) {
            $table->dropForeign('FK_qf5yrej3obl5admbo3k1c50gu');
        });
    }
}
