<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToContractoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('contracto', function (Blueprint $table) {
            $table->foreign(['funcionario_func_id'], 'FK_2t6gxr1ohqqabxf71yc36rh3d')->references(['func_id'])->on('funcionario');
            $table->foreign(['Entidade_enti_id'], 'FK_7one04jhrnowbxeji0ik25qo5')->references(['enti_id'])->on('entidade');
            $table->foreign(['clienteclie_clie_id'], 'FK_4lts1hkl27bjgyuc7wgpksd4v')->references(['clie_id'])->on('cliente');
            $table->foreign(['servicoserv_serv_id'], 'FK_kmoo260fu7x7dxasdt7xw2s4s')->references(['serv_id'])->on('servico');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('contracto', function (Blueprint $table) {
            $table->dropForeign('FK_2t6gxr1ohqqabxf71yc36rh3d');
            $table->dropForeign('FK_7one04jhrnowbxeji0ik25qo5');
            $table->dropForeign('FK_4lts1hkl27bjgyuc7wgpksd4v');
            $table->dropForeign('FK_kmoo260fu7x7dxasdt7xw2s4s');
        });
    }
}
