<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToSalaexameTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('salaexame', function (Blueprint $table) {
            $table->foreign(['juri1_doce_id'], 'FK_oo7etj1ejw11gwldvussvspho')->references(['doce_id'])->on('docente');
            $table->foreign(['anoLectivo_anol_id'], 'FK_5ad0wnuqph8a86784s2pm84i')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['entidade_enti_id'], 'FK_fc2836km5gbcc23k0blkbwl4o')->references(['enti_id'])->on('entidade');
            $table->foreign(['curso_curs_id'], 'FK_nc03gbvb75hx9xbnk1m3jtrk6')->references(['curs_id'])->on('curso');
            $table->foreign(['disciplina_disc_id'], 'FK_s2i6fb0xh6ojc5enpuqp9wi5r')->references(['disc_id'])->on('disciplina');
            $table->foreign(['juri2_doce_id'], 'FK_8wcs069go81f4why9bukdw7yl')->references(['doce_id'])->on('docente');
            $table->foreign(['sala_sala_id'], 'FK_lp8rrivbnydsgmq6lqq1toer1')->references(['sala_id'])->on('sala');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('salaexame', function (Blueprint $table) {
            $table->dropForeign('FK_oo7etj1ejw11gwldvussvspho');
            $table->dropForeign('FK_5ad0wnuqph8a86784s2pm84i');
            $table->dropForeign('FK_fc2836km5gbcc23k0blkbwl4o');
            $table->dropForeign('FK_nc03gbvb75hx9xbnk1m3jtrk6');
            $table->dropForeign('FK_s2i6fb0xh6ojc5enpuqp9wi5r');
            $table->dropForeign('FK_8wcs069go81f4why9bukdw7yl');
            $table->dropForeign('FK_lp8rrivbnydsgmq6lqq1toer1');
        });
    }
}
