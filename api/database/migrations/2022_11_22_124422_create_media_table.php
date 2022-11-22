<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMediaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('media', function (Blueprint $table) {
            $table->integer('medi_id', true);
            $table->boolean('encrypted');
            $table->string('med_semestre')->nullable();
            $table->float('medi_media', 10, 0);
            $table->float('medi_media2', 10, 0);
            $table->float('medi_media3', 10, 0);
            $table->integer('aluno_alun_id')->nullable()->index('FK_a5y2kmp2d4ps55ejivqqxkq4q');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_syeeo0owc0kpoi63pms4jncrq');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_8c1otoe3gpk18icphq8m7swwq');
            $table->integer('entidade_enti_id')->nullable()->index('FK_24j3ky0oiyqrnbb6njf1hcvcj');
            $table->integer('inscricao_insc_id')->nullable()->index('FK_ie7tc2p7ppkh5r56t09ydlkfm');
            $table->integer('turma_turm_id')->nullable()->index('FK_dq9itvdjwejv4xxe58gdxckd4');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('media');
    }
}
