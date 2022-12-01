<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSalaexameTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('salaexame', function (Blueprint $table) {
            $table->integer('salae_id', true);
            $table->dateTime('salae_data')->nullable();
            $table->integer('salae_maxAlunos');
            $table->integer('salae_ocupado');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_5ad0wnuqph8a86784s2pm84i');
            $table->integer('curso_curs_id')->nullable()->index('FK_nc03gbvb75hx9xbnk1m3jtrk6');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_s2i6fb0xh6ojc5enpuqp9wi5r');
            $table->integer('entidade_enti_id')->nullable()->index('FK_fc2836km5gbcc23k0blkbwl4o');
            $table->integer('juri1_doce_id')->nullable()->index('FK_oo7etj1ejw11gwldvussvspho');
            $table->integer('juri2_doce_id')->nullable()->index('FK_8wcs069go81f4why9bukdw7yl');
            $table->integer('sala_sala_id')->nullable()->index('FK_lp8rrivbnydsgmq6lqq1toer1');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('salaexame');
    }
}
