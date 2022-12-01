<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDisciplinaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('disciplina', function (Blueprint $table) {
            $table->integer('disc_id', true);
            $table->integer('disc_cargaHoraria');
            $table->string('disc_codigo')->nullable();
            $table->string('disc_descricao')->nullable();
            $table->string('disc_grupo')->nullable();
            $table->string('disc_semestre')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_grsg69oau24l68e1anxnohfow');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('disciplina');
    }
}
