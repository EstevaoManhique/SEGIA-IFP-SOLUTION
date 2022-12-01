<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormulariosusuarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('formulariosusuario', function (Blueprint $table) {
            $table->integer('formu_id', true);
            $table->boolean('formu_d');
            $table->boolean('formu_i');
            $table->boolean('formu_u');
            $table->boolean('formu_v');
            $table->integer('formulario_form_id')->nullable()->index('FK_qedv1256qr19185d74h659puh');
            $table->integer('moduloUsuario_modu_id')->nullable()->index('FK_akknnmwc7s8jbcgiwk7ffkjpg');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('formulariosusuario');
    }
}
