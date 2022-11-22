<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToFormulariosusuarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('formulariosusuario', function (Blueprint $table) {
            $table->foreign(['moduloUsuario_modu_id'], 'FK_akknnmwc7s8jbcgiwk7ffkjpg')->references(['modu_id'])->on('modulousuario');
            $table->foreign(['formulario_form_id'], 'FK_qedv1256qr19185d74h659puh')->references(['form_id'])->on('formulario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('formulariosusuario', function (Blueprint $table) {
            $table->dropForeign('FK_akknnmwc7s8jbcgiwk7ffkjpg');
            $table->dropForeign('FK_qedv1256qr19185d74h659puh');
        });
    }
}
