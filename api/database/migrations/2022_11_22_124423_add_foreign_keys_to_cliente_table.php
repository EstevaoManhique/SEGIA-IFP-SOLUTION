<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToClienteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('cliente', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_10brqolm3gt59gcakn2o146u0')->references(['enti_id'])->on('entidade');
            $table->foreign(['pessoapess_pess_id'], 'FK_3d8yf1m8qy81ovurrtetgubve')->references(['pess_id'])->on('pessoa');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('cliente', function (Blueprint $table) {
            $table->dropForeign('FK_10brqolm3gt59gcakn2o146u0');
            $table->dropForeign('FK_3d8yf1m8qy81ovurrtetgubve');
        });
    }
}
