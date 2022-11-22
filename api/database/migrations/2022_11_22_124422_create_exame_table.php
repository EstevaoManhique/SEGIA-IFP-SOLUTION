<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExameTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exame', function (Blueprint $table) {
            $table->integer('exam_id', true);
            $table->boolean('encrypted');
            $table->boolean('exam_extraodinario');
            $table->boolean('exam_fraude');
            $table->float('exam_media', 10, 0);
            $table->boolean('exam_naRecorrencia');
            $table->float('exam_nota', 10, 0);
            $table->float('exam_notaFinal', 10, 0);
            $table->boolean('exam_presenca');
            $table->float('exam_recorrencia', 10, 0);
            $table->string('exam_semestre')->nullable();
            $table->integer('aluno_alun_id')->nullable()->index('FK_7fp9b02gfuj5ihrpned1qdie5');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_ohlqhdvrnddsfac8yrvrj6k8h');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_6cn7ybgwypslpusof4jfmafr5');
            $table->integer('entidade_enti_id')->nullable()->index('FK_ao14u1oumwx3su9r6f3mg3tca');
            $table->integer('inscricao_insc_id')->nullable()->index('FK_hypknfacmlg2muescafsxjx0y');
            $table->integer('salaExame_salae_id')->nullable()->index('FK_6yr3292ylfg9uues9k28edlrf');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('exame');
    }
}
