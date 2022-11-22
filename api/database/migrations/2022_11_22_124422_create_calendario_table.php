<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCalendarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('calendario', function (Blueprint $table) {
            $table->integer('cale_id', true);
            $table->dateTime('cale_acp')->nullable();
            $table->dateTime('cale_acp2')->nullable();
            $table->dateTime('cale_acp2Limite')->nullable();
            $table->dateTime('cale_acpLimite')->nullable();
            $table->dateTime('cale_exame')->nullable();
            $table->dateTime('cale_exameLimite')->nullable();
            $table->boolean('cale_haveAcp');
            $table->boolean('cale_haveExame');
            $table->boolean('cale_haveTeste3');
            $table->boolean('cale_haveTeste4');
            $table->dateTime('cale_recorrencia')->nullable();
            $table->dateTime('cale_recorrenciaLimite')->nullable();
            $table->string('cale_semestre')->nullable();
            $table->dateTime('cale_teste1')->nullable();
            $table->dateTime('cale_teste1Limite')->nullable();
            $table->dateTime('cale_teste2')->nullable();
            $table->dateTime('cale_teste2Limite')->nullable();
            $table->dateTime('cale_teste3')->nullable();
            $table->dateTime('cale_teste3Limite')->nullable();
            $table->dateTime('cale_teste4')->nullable();
            $table->dateTime('cale_teste4Limite')->nullable();
            $table->boolean('encrypted');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_32uujplvdhlrg5oa979oq5vdu');
            $table->integer('curso_curs_id')->nullable()->index('FK_ry23c7th8hjprj2ef7k0w52qv');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_98mxa2b9760hj8sv2187uahnh');
            $table->integer('docente_doce_id')->nullable()->index('FK_5g188ca99e6q7hhbpjikw6tta');
            $table->integer('entidade_enti_id')->nullable()->index('FK_9fgbiary8onfif286f2ykm8lg');
            $table->integer('juri1_doce_id')->nullable()->index('FK_gccsrxn9qkuasrga6x1v4obmr');
            $table->integer('juri2_doce_id')->nullable()->index('FK_7746ft7hog9q6i39bh1m3ffvc');
            $table->integer('juri3_doce_id')->nullable()->index('FK_mwds2x932u8pnkos7j8veq0oo');
            $table->integer('juri4_doce_id')->nullable()->index('FK_e6po33lyxud6bv0671pmpxejw');
            $table->integer('turma_turm_id')->nullable()->index('FK_74odnvyv7w55sfw52tffsoqlw');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('calendario');
    }
}
