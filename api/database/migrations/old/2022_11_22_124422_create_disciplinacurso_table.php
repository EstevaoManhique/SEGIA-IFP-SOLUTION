<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDisciplinacursoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('disciplinacurso', function (Blueprint $table) {
            $table->integer('disd_id', true);
            $table->string('disd_semestre')->nullable();
            $table->boolean('encrypted');
            $table->integer('curso_curs_id')->nullable()->index('FK_6kwg61ee7c432fakqmn6mjmw0');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_m28yaqqphd17gldaxbdhx0s6o');
            $table->integer('entidade_enti_id')->nullable()->index('FK_qihsrlaipmg9xxtkwssw8m6bk');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('disciplinacurso');
    }
}
