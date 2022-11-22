<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToBoletimTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('boletim', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_86y8cp7luvxmoq2mnrfqw7ivf')->references(['enti_id'])->on('entidade');
            $table->foreign(['inscricao_insc_id'], 'FK_om82qwj8rf5r3grbk5so4yxd8')->references(['insc_id'])->on('inscricao');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('boletim', function (Blueprint $table) {
            $table->dropForeign('FK_86y8cp7luvxmoq2mnrfqw7ivf');
            $table->dropForeign('FK_om82qwj8rf5r3grbk5so4yxd8');
        });
    }
}
