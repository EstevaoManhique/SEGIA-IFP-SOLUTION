<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateModuloacessoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('moduloacesso', function (Blueprint $table) {
            $table->integer('moac_id', true);
            $table->boolean('encrypted');
            $table->string('moac_baseDados')->nullable();
            $table->string('moac_chaveAcesso')->nullable();
            $table->string('moac_chaveUsuarios')->nullable();
            $table->dateTime('moac_dataActivacao')->nullable();
            $table->dateTime('moac_dataFinalTrial')->nullable();
            $table->string('moac_dataFinalTrialEncry')->nullable();
            $table->integer('moac_diasRemanescentes')->nullable();
            $table->string('moac_diasRemanescentesEncry')->nullable();
            $table->string('moac_imagemFundo')->nullable();
            $table->string('moac_perfilCores')->nullable();
            $table->integer('entidadeenti_enti_id')->nullable()->index('FK_ksdsgaq9vxjai8v1e06a344e1');
            $table->integer('sistema_sist_id')->nullable()->index('FK_jc0kkxavfkfp4f0yb1d3iyod8');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('moduloacesso');
    }
}
