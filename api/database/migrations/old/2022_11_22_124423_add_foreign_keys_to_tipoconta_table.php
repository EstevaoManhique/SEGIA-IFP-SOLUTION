<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToTipocontaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tipoconta', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_2swysbcfpbq0kyrvrhk8l9o99')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tipoconta', function (Blueprint $table) {
            $table->dropForeign('FK_2swysbcfpbq0kyrvrhk8l9o99');
        });
    }
}
