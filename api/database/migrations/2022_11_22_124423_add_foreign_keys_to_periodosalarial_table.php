<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToPeriodosalarialTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('periodosalarial', function (Blueprint $table) {
            $table->foreign(['usuarioVerifica_usua_id'], 'FK_9ftg9tf7g0yisx31vxp7au8jm')->references(['usua_id'])->on('usuario');
            $table->foreign(['usuarioAutoriza_usua_id'], 'FK_g6hynq896la38h54a9ncjfbwt')->references(['usua_id'])->on('usuario');
            $table->foreign(['usuario_usua_id'], 'FK_amkgr1nuve6rn2x9l1wwidi7x')->references(['usua_id'])->on('usuario');
            $table->foreign(['entidade_enti_id'], 'FK_n86ghfraa4lntmqncj46ws0cr')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('periodosalarial', function (Blueprint $table) {
            $table->dropForeign('FK_9ftg9tf7g0yisx31vxp7au8jm');
            $table->dropForeign('FK_g6hynq896la38h54a9ncjfbwt');
            $table->dropForeign('FK_amkgr1nuve6rn2x9l1wwidi7x');
            $table->dropForeign('FK_n86ghfraa4lntmqncj46ws0cr');
        });
    }
}
