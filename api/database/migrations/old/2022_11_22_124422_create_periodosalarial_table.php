<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePeriodosalarialTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('periodosalarial', function (Blueprint $table) {
            $table->integer('pers_id', true);
            $table->boolean('encrypted');
            $table->dateTime('pers_data')->nullable();
            $table->string('pers_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_n86ghfraa4lntmqncj46ws0cr');
            $table->integer('usuario_usua_id')->nullable()->index('FK_amkgr1nuve6rn2x9l1wwidi7x');
            $table->integer('usuarioAutoriza_usua_id')->nullable()->index('FK_g6hynq896la38h54a9ncjfbwt');
            $table->integer('usuarioVerifica_usua_id')->nullable()->index('FK_9ftg9tf7g0yisx31vxp7au8jm');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('periodosalarial');
    }
}
