<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHorarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('horario', function (Blueprint $table) {
            $table->integer('hora_id', true);
            $table->boolean('encrypted');
            $table->string('hora_fim')->nullable();
            $table->string('hora_inicio')->nullable();
            $table->boolean('hora_usado');
            $table->integer('entidade_enti_id')->nullable()->index('FK_dw45ijcfdjf3ejgtagpfnun3q');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('horario');
    }
}
