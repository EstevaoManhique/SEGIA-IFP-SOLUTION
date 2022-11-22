<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDocenteturmaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('docenteturma', function (Blueprint $table) {
            $table->integer('doct_id', true);
            $table->integer('docente_doce_id')->nullable()->index('FK_2lwqcfjywgpyj3wbhl1nsx6f0');
            $table->integer('entidade_enti_id')->nullable()->index('FK_q14kouux2noty67ph80ihj8r4');
            $table->integer('turma_turm_id')->nullable()->index('FK_l8u5pwbh9neqhp3ku2gftjheb');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('docenteturma');
    }
}
