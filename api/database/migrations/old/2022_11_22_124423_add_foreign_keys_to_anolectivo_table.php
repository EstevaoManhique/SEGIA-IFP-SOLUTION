<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAnolectivoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('anolectivo', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_frxat7s9w6gnsrjfp5xy1av0b')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('anolectivo', function (Blueprint $table) {
            $table->dropForeign('FK_frxat7s9w6gnsrjfp5xy1av0b');
        });
    }
}
