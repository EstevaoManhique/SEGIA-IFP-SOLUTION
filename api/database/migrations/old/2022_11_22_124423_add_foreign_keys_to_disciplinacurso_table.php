<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToDisciplinacursoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('disciplinacurso', function (Blueprint $table) {
            $table->foreign(['curso_curs_id'], 'FK_6kwg61ee7c432fakqmn6mjmw0')->references(['curs_id'])->on('curso');
            $table->foreign(['entidade_enti_id'], 'FK_qihsrlaipmg9xxtkwssw8m6bk')->references(['enti_id'])->on('entidade');
            $table->foreign(['disciplina_disc_id'], 'FK_m28yaqqphd17gldaxbdhx0s6o')->references(['disc_id'])->on('disciplina');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('disciplinacurso', function (Blueprint $table) {
            $table->dropForeign('FK_6kwg61ee7c432fakqmn6mjmw0');
            $table->dropForeign('FK_qihsrlaipmg9xxtkwssw8m6bk');
            $table->dropForeign('FK_m28yaqqphd17gldaxbdhx0s6o');
        });
    }
}
