<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMatriculaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('matricula', function (Blueprint $table) {
            $table->integer('matr_id', true);
            $table->string('cod_escola')->nullable();
            $table->string('matr_ano')->nullable();
            $table->integer('matr_assistente');
            $table->string('matr_classe')->nullable();
            $table->integer('matr_continuante');
            $table->integer('matr_faixa_05');
            $table->integer('matr_faixa_1115');
            $table->integer('matr_faixa_1625');
            $table->integer('matr_faixa_2635');
            $table->integer('matr_faixa_35');
            $table->integer('matr_faixa_610');
            $table->integer('matr_homens');
            $table->integer('matr_mulheres');
            $table->integer('matr_novo');
            $table->integer('matr_repetente');
            $table->integer('matr_transferido');
            $table->integer('matr_turmas');
            $table->integer('matr_vuneraveis');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('matricula');
    }
}
