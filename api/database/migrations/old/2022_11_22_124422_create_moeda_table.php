<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMoedaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('moeda', function (Blueprint $table) {
            $table->integer('moe_id', true);
            $table->boolean('encrypted');
            $table->double('moe_cambio')->nullable();
            $table->string('moe_nome')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_2rnrolstx6iaj0b4vgk0wbjd2');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('moeda');
    }
}
