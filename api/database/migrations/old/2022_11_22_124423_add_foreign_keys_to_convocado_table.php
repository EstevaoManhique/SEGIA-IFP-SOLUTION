<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToConvocadoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('convocado', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_8xcrfflv1v2wfcm07rx97dkv7')->references(['enti_id'])->on('entidade');
            $table->foreign(['pessoa_pess_id'], 'FK_dtqf2v1wb9pyu7k811xvf0ufg')->references(['pess_id'])->on('pessoa');
            $table->foreign(['escola_esc_id'], 'FK_ajfqe71ni8lnju81afalc31t0')->references(['esc_id'])->on('escola');
            $table->foreign(['convocatoria_conv_id'], 'FK_svbwen9x84a0an3kwvqbouh5a')->references(['conv_id'])->on('convocatoria');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('convocado', function (Blueprint $table) {
            $table->dropForeign('FK_8xcrfflv1v2wfcm07rx97dkv7');
            $table->dropForeign('FK_dtqf2v1wb9pyu7k811xvf0ufg');
            $table->dropForeign('FK_ajfqe71ni8lnju81afalc31t0');
            $table->dropForeign('FK_svbwen9x84a0an3kwvqbouh5a');
        });
    }
}
