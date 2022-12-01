<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTurnoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('turno', function (Blueprint $table) {
            $table->integer('turn_id', true);
            $table->boolean('encrypted');
            $table->string('turn_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_na73qssrt3o6lgh71qb320qie');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('turno');
    }
}
