<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHorasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('horas', function (Blueprint $table) {
            $table->integer('hora_id', true);
            $table->boolean('encrypted');
            $table->string('hora_categoria')->nullable();
            $table->dateTime('hora_data')->nullable();
            $table->integer('hora_duracao');
            $table->string('hora_obseravoes')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_dib40nsrei872umfjtkxdh23c');
            $table->integer('funcionario_func_id')->nullable()->index('FK_283l5evl1uv8otjdkda4nl4w1');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('horas');
    }
}
