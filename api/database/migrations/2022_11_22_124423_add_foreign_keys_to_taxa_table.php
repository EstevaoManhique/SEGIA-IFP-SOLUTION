<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToTaxaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('taxa', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_tg5ij935hkthgihs7v7uou4al')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('taxa', function (Blueprint $table) {
            $table->dropForeign('FK_tg5ij935hkthgihs7v7uou4al');
        });
    }
}
