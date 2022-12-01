<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContractoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contracto', function (Blueprint $table) {
            $table->integer('cnt_id', true);
            $table->string('cnt_agencia')->nullable();
            $table->string('cnt_banco')->nullable();
            $table->string('cnt_beneficios')->nullable();
            $table->bigInteger('cnt_conta');
            $table->dateTime('cnt_dataadmissao')->nullable();
            $table->dateTime('cnt_datafim')->nullable();
            $table->dateTime('cnt_datainicio')->nullable();
            $table->string('cnt_graohierarquico')->nullable();
            $table->string('cnt_horassemanais')->nullable();
            $table->double('cnt_salario');
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_7one04jhrnowbxeji0ik25qo5');
            $table->integer('clienteclie_clie_id')->nullable()->index('FK_4lts1hkl27bjgyuc7wgpksd4v');
            $table->integer('funcionario_func_id')->nullable()->index('FK_2t6gxr1ohqqabxf71yc36rh3d');
            $table->integer('servicoserv_serv_id')->nullable()->index('FK_kmoo260fu7x7dxasdt7xw2s4s');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contracto');
    }
}
