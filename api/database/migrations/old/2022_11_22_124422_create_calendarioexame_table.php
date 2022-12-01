<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCalendarioexameTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('calendarioexame', function (Blueprint $table) {
            $table->integer('calee_id', true);
            $table->dateTime('calee_exame')->nullable();
            $table->dateTime('calee_exameLimite')->nullable();
            $table->dateTime('calee_recorrencia')->nullable();
            $table->dateTime('calee_recorrenciaLimite')->nullable();
            $table->string('calee_semestre')->nullable();
            $table->boolean('encrypted');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_rvd5vqdpebu392hsuw6bmismo');
            $table->integer('curso_curs_id')->nullable()->index('FK_ucqb3a5culx0xu4gbmv07eta');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_wuumfdmtmy08penr2x2gsvnf');
            $table->integer('entidade_enti_id')->nullable()->index('FK_3x7p6epyknjn2jfceuqjcgvi7');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('calendarioexame');
    }
}
