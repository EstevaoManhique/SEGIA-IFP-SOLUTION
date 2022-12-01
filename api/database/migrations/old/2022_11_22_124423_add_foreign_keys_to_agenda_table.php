<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAgendaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('agenda', function (Blueprint $table) {
            $table->foreign(['turma_turm_id'], 'FK_2emmtpsc80b2xtsm4cs5qrh7v')->references(['turm_id'])->on('turma');
            $table->foreign(['entidade_enti_id'], 'FK_7ysi2nb4tddwb49y2h2qtlwex')->references(['enti_id'])->on('entidade');
            $table->foreign(['anoLectivo_anol_id'], 'FK_3gi8xqmtd9khgc1scftmi992q')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['disciplina_disc_id'], 'FK_ondexcxujgssi7jgwix1ttsi')->references(['disc_id'])->on('disciplina');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('agenda', function (Blueprint $table) {
            $table->dropForeign('FK_2emmtpsc80b2xtsm4cs5qrh7v');
            $table->dropForeign('FK_7ysi2nb4tddwb49y2h2qtlwex');
            $table->dropForeign('FK_3gi8xqmtd9khgc1scftmi992q');
            $table->dropForeign('FK_ondexcxujgssi7jgwix1ttsi');
        });
    }
}
