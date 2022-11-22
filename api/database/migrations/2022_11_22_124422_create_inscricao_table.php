<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInscricaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inscricao', function (Blueprint $table) {
            $table->integer('insc_id', true);
            $table->boolean('insc_activa');
            $table->string('insc_anoLectivo')->nullable();
            $table->string('insc_categoria')->nullable();
            $table->boolean('insc_certificado');
            $table->string('insc_comp1')->nullable();
            $table->string('insc_comp2')->nullable();
            $table->string('insc_comp3')->nullable();
            $table->string('insc_comp4')->nullable();
            $table->string('insc_condicao')->nullable();
            $table->boolean('insc_copiaBI');
            $table->dateTime('insc_dataInscricao')->nullable();
            $table->dateTime('insc_dataProximoPagamento')->nullable();
            $table->dateTime('insc_dataUltimoPagamento')->nullable();
            $table->integer('insc_faltas');
            $table->integer('insc_faltasJustificadas');
            $table->boolean('insc_fotos');
            $table->float('insc_notaFinal', 10, 0);
            $table->string('insc_nrTransfercia')->nullable();
            $table->string('insc_origem')->nullable();
            $table->boolean('insc_ppf');
            $table->string('insc_referencia')->nullable();
            $table->boolean('insc_regular');
            $table->string('insc_semestre')->nullable();
            $table->string('insc_turno')->nullable();
            $table->integer('aluno_alun_id')->nullable()->index('FK_s1nuxyfeo8b80m8ni7by9kikr');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_9erfl299rv2wy5n2cp0fn9ks0');
            $table->integer('curso_curs_id')->nullable()->index('FK_gx178uqpqdb0i87lukjifj3nl');
            $table->integer('entidade_enti_id')->nullable()->index('FK_bowie4p725a210no3ukjgtxxi');
            $table->integer('turma_turm_id')->nullable()->index('FK_96ffud0y1ccfyvcwkq1366cn8');
            $table->integer('turno_turn_id')->nullable()->index('FK_yuw9jl6rvbeahytnik5cgh4q');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('inscricao');
    }
}
