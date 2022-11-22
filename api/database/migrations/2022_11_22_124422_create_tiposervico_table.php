<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTiposervicoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tiposervico', function (Blueprint $table) {
            $table->integer('tps_id', true);
            $table->boolean('encrypted');
            $table->string('tps_descricao')->nullable();
            $table->boolean('tps_igonoraTonelagem');
            $table->integer('entidade_enti_id')->nullable()->index('FK_es4rf2ptocmkdl7ug04x7qwn9');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tiposervico');
    }
}
