<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAgendaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('agenda', function (Blueprint $table) {
            $table->integer('agen_id', true);
            $table->string('agen_diaSemana')->nullable();
            $table->string('agen_hora')->nullable();
            $table->string('agen_semestre')->nullable();
            $table->boolean('encrypted');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_3gi8xqmtd9khgc1scftmi992q');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_ondexcxujgssi7jgwix1ttsi');
            $table->integer('entidade_enti_id')->nullable()->index('FK_7ysi2nb4tddwb49y2h2qtlwex');
            $table->integer('turma_turm_id')->nullable()->index('FK_2emmtpsc80b2xtsm4cs5qrh7v');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('agenda');
    }
}
