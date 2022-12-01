<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToTipousuarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tipousuario', function (Blueprint $table) {
            $table->foreign(['nivelAcessoniva_niva_id'], 'FK_e5h1x62vnbq7ts4geevumdr29')->references(['niva_id'])->on('nivelacesso');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tipousuario', function (Blueprint $table) {
            $table->dropForeign('FK_e5h1x62vnbq7ts4geevumdr29');
        });
    }
}
