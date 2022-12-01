<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateModulousuarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('modulousuario', function (Blueprint $table) {
            $table->integer('modu_id', true);
            $table->boolean('encrypted');
            $table->dateTime('modu_dataUltimoLogin')->nullable();
            $table->string('modu_referencia')->nullable();
            $table->integer('modu_visitas');
            $table->integer('moduloAcesso_moac_id')->nullable()->index('FK_84t0hynggh54oqmn0mt2hax6o');
            $table->integer('usuario_usua_id')->nullable()->index('FK_hxhp0fppiir6fjjdfk6cpig11');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('modulousuario');
    }
}
