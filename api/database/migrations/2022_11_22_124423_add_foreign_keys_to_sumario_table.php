<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToSumarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('sumario', function (Blueprint $table) {
            $table->foreign(['disciplina_disc_id'], 'FK_2w0wkbh7ep11riawie9i7bpim')->references(['disc_id'])->on('disciplina');
            $table->foreign(['entidade_enti_id'], 'FK_erkiyr7cye2qv80t10qrjhn9e')->references(['enti_id'])->on('entidade');
            $table->foreign(['curso_curs_id'], 'FK_oecbiu66b904ef74s061oxqpb')->references(['curs_id'])->on('curso');
            $table->foreign(['escola_esc_id'], 'FK_2ye3jt4ejmc3bx0p8u58vobq7')->references(['esc_id'])->on('escola');
            $table->foreign(['tema_tema_id'], 'FK_j66ial8ufj23ubel985dv03ne')->references(['tema_id'])->on('tema');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('sumario', function (Blueprint $table) {
            $table->dropForeign('FK_2w0wkbh7ep11riawie9i7bpim');
            $table->dropForeign('FK_erkiyr7cye2qv80t10qrjhn9e');
            $table->dropForeign('FK_oecbiu66b904ef74s061oxqpb');
            $table->dropForeign('FK_2ye3jt4ejmc3bx0p8u58vobq7');
            $table->dropForeign('FK_j66ial8ufj23ubel985dv03ne');
        });
    }
}
