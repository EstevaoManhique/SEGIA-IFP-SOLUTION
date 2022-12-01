<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTurmaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('turma', function (Blueprint $table) {
            $table->integer('turm_id', true);
            $table->boolean('encrypted');
            $table->dateTime('turm_dataFim')->nullable();
            $table->dateTime('turm_dataInicio')->nullable();
            $table->string('turm_descricao')->nullable();
            $table->string('turm_horario')->nullable();
            $table->integer('turm_maxEstudantes');
            $table->integer('turm_minEstudantes');
            $table->integer('turm_numOcupado');
            $table->string('turm_referencia')->nullable();
            $table->string('turm_turno')->nullable();
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_bjtfwyhokopn8tmrlagm7g9u5');
            $table->integer('curso_curs_id')->nullable()->index('FK_f0slo7hicixq14ep3d30x3ncn');
            $table->integer('entidade_enti_id')->nullable()->index('FK_elqbpy4e3ei8gxuwmd600mlnm');
            $table->integer('escola_esc_id')->nullable()->index('FK_5qqkdoye2cw1blidt4815bg4i');
            $table->integer('sala_sala_id')->nullable()->index('FK_r1eadv9h70hlo5gaeci57t604');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('turma');
    }
}
