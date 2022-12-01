<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToDocenteturmaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('docenteturma', function (Blueprint $table) {
            $table->foreign(['docente_doce_id'], 'FK_2lwqcfjywgpyj3wbhl1nsx6f0')->references(['doce_id'])->on('docente');
            $table->foreign(['entidade_enti_id'], 'FK_q14kouux2noty67ph80ihj8r4')->references(['enti_id'])->on('entidade');
            $table->foreign(['turma_turm_id'], 'FK_l8u5pwbh9neqhp3ku2gftjheb')->references(['turm_id'])->on('turma');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('docenteturma', function (Blueprint $table) {
            $table->dropForeign('FK_2lwqcfjywgpyj3wbhl1nsx6f0');
            $table->dropForeign('FK_q14kouux2noty67ph80ihj8r4');
            $table->dropForeign('FK_l8u5pwbh9neqhp3ku2gftjheb');
        });
    }
}
