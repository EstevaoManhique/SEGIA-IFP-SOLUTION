<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFaltasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('faltas', function (Blueprint $table) {
            $table->integer('flt_id', true);
            $table->boolean('encrypted');
            $table->dateTime('flt_data')->nullable();
            $table->dateTime('flt_dataJustificacao')->nullable();
            $table->string('flt_descricao')->nullable();
            $table->string('flt_status')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_hqjkt4f6b6kuyihe43fh2ok4v');
            $table->integer('funcionario_func_id')->nullable()->index('FK_s4jc3autodujjf41a380ejil8');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('faltas');
    }
}
