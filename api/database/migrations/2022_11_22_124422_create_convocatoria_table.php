<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateConvocatoriaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('convocatoria', function (Blueprint $table) {
            $table->integer('conv_id', true);
            $table->longText('conv_1')->nullable();
            $table->longText('conv_10')->nullable();
            $table->longText('conv_2')->nullable();
            $table->longText('conv_3')->nullable();
            $table->longText('conv_4')->nullable();
            $table->longText('conv_5')->nullable();
            $table->longText('conv_6')->nullable();
            $table->longText('conv_7')->nullable();
            $table->longText('conv_8')->nullable();
            $table->longText('conv_9')->nullable();
            $table->boolean('conv_acta');
            $table->dateTime('conv_data')->nullable();
            $table->dateTime('conv_dataReuniao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_gkdc0jlmd4xm2xgp62eivb0rb');
            $table->integer('escola_esc_id')->nullable()->index('FK_apoof1bkue143pkqin5kwwx4y');
            $table->integer('presidente_pess_id')->nullable()->index('FK_e0xt4d8ncvmnwlychpy9ly9tw');
            $table->integer('sala_sala_id')->nullable()->index('FK_hh963dw5wk8duqwvdx0r5h0t0');
            $table->integer('secretario_pess_id')->nullable()->index('FK_t3hiysasu59vo0q8dkbxwqtji');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('convocatoria');
    }
}
