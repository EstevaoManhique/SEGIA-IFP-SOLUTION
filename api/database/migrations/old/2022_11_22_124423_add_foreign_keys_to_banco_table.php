<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToBancoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('banco', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_47jyd7i2oqfr8g2w6320q8ujh')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('banco', function (Blueprint $table) {
            $table->dropForeign('FK_47jyd7i2oqfr8g2w6320q8ujh');
        });
    }
}
