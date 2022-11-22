<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNotasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notas', function (Blueprint $table) {
            $table->integer('nota_id', true);
            $table->boolean('encrypted');
            $table->boolean('isAcp2');
            $table->boolean('isTeste3');
            $table->boolean('isTeste4');
            $table->float('nota_acp', 10, 0);
            $table->float('nota_acp2', 10, 0);
            $table->float('nota_avaliacaoContinua', 10, 0);
            $table->float('nota_media', 10, 0);
            $table->string('nota_semestre')->nullable();
            $table->float('nota_teste1', 10, 0);
            $table->float('nota_teste2', 10, 0);
            $table->float('nota_teste3', 10, 0);
            $table->float('nota_teste4', 10, 0);
            $table->float('nota_trabPratico', 10, 0);
            $table->integer('aluno_alun_id')->nullable()->index('FK_m9xigny2j8ml20pbayewwoxa0');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_npauu1jp16y8ynvkx1gxuyp92');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_8pfotl50da7a8bptenacyt172');
            $table->integer('entidade_enti_id')->nullable()->index('FK_8tunkwvd1cb5vqhdw500mw2tm');
            $table->integer('inscricao_insc_id')->nullable()->index('FK_1c8qjujjprm04lmiy71pcjrf7');
            $table->integer('turma_turm_id')->nullable()->index('FK_fe3oe0fg0bqbr3s7itq7qufxc');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('notas');
    }
}
