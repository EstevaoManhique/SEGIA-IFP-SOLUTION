<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateListatelefonicaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('listatelefonica', function (Blueprint $table) {
            $table->integer('lst_id', true);
            $table->boolean('encrypted');
            $table->string('lst_categoria')->nullable();
            $table->string('lst_nome')->nullable();
            $table->string('lst_telefone')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_gmjl77s4abl5s2w1ldn62necl');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('listatelefonica');
    }
}
