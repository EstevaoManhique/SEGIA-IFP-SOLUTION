<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToExtractocontageralTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('extractocontageral', function (Blueprint $table) {
            $table->foreign(['contaGeral_ctg_id'], 'FK_19gkfusc1nfoicys516judg7m')->references(['ctg_id'])->on('contageral');
            $table->foreign(['entidade_enti_id'], 'FK_k4i70e28jhu9nia1xn6bjhc6j')->references(['enti_id'])->on('entidade');
            $table->foreign(['lancamento_lan_id'], 'FK_k358qt33e6loreuv1jnmnncib')->references(['lan_id'])->on('lancamento');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('extractocontageral', function (Blueprint $table) {
            $table->dropForeign('FK_19gkfusc1nfoicys516judg7m');
            $table->dropForeign('FK_k4i70e28jhu9nia1xn6bjhc6j');
            $table->dropForeign('FK_k358qt33e6loreuv1jnmnncib');
        });
    }
}
