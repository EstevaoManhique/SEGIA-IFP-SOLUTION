<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateConvocadoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('convocado', function (Blueprint $table) {
            $table->integer('convo_id', true);
            $table->integer('convocatoria_conv_id')->nullable()->index('FK_svbwen9x84a0an3kwvqbouh5a');
            $table->integer('entidade_enti_id')->nullable()->index('FK_8xcrfflv1v2wfcm07rx97dkv7');
            $table->integer('escola_esc_id')->nullable()->index('FK_ajfqe71ni8lnju81afalc31t0');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_dtqf2v1wb9pyu7k811xvf0ufg');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('convocado');
    }
}
