<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCursoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('curso', function (Blueprint $table) {
            $table->integer('curs_id', true);
            $table->integer('curs_aprovacoes');
            $table->string('curs_cod')->nullable();
            $table->double('curs_custoInscricao');
            $table->string('curs_descricao')->nullable();
            $table->integer('curs_duracao');
            $table->boolean('curs_exame');
            $table->integer('curs_inscritos');
            $table->integer('curs_numPrestacoes');
            $table->integer('curs_numTurmas');
            $table->double('curs_preco');
            $table->integer('curs_reprovacoes');
            $table->string('curs_tipo')->nullable();
            $table->boolean('encrypted');
            $table->integer('areaFormacao_aref_id')->nullable()->index('FK_bkd5vu4xxqy225d2o6xnlgq8a');
            $table->integer('entidade_enti_id')->nullable()->index('FK_5oh9yrcu7v3hvcwfbs14acxrg');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('curso');
    }
}
