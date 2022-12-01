<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToPetyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('pety', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_iv3p9fufx82ldaso32d8ap72q')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('pety', function (Blueprint $table) {
            $table->dropForeign('FK_iv3p9fufx82ldaso32d8ap72q');
        });
    }
}
