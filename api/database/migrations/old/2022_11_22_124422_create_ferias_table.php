<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFeriasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ferias', function (Blueprint $table) {
            $table->integer('fer_id', true);
            $table->boolean('encrypted');
            $table->dateTime('fer_datafim')->nullable();
            $table->dateTime('fer_datainicio')->nullable();
            $table->string('fer_observacoes')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_kud22pc3xtvpc82tvof058f05');
            $table->integer('funcionario_func_id')->nullable()->index('FK_7ogq58mmtmp7gx5g142ds318k');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ferias');
    }
}
