<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAssiduidadeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('assiduidade', function (Blueprint $table) {
            $table->integer('assi_id', true);
            $table->dateTime('assi_data')->nullable();
            $table->string('assi_horaEntrada')->nullable();
            $table->string('assi_horaSaida')->nullable();
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_taej257uv67ps6ht9rdou3s45');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_knqx8leyqvxp3an5btor1s5sw');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('assiduidade');
    }
}
