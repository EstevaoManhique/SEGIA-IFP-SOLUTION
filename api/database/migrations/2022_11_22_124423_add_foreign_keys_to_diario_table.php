<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToDiarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('diario', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_johda3lae471pitwiv31dewhg')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('diario', function (Blueprint $table) {
            $table->dropForeign('FK_johda3lae471pitwiv31dewhg');
        });
    }
}
