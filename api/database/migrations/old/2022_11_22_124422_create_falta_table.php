<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFaltaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('falta', function (Blueprint $table) {
            $table->integer('falt_id', true);
            $table->string('cod_escola')->nullable();
            $table->integer('falt_01');
            $table->integer('falt_02');
            $table->integer('falt_03');
            $table->integer('falt_04');
            $table->integer('falt_05');
            $table->integer('falt_06');
            $table->integer('falt_07');
            $table->integer('falt_08');
            $table->integer('falt_09');
            $table->integer('falt_10');
            $table->integer('falt_11');
            $table->integer('falt_12');
            $table->string('falt_ano')->nullable();
            $table->integer('falt_j_01');
            $table->integer('falt_j_02');
            $table->integer('falt_j_03');
            $table->integer('falt_j_04');
            $table->integer('falt_j_05');
            $table->integer('falt_j_06');
            $table->integer('falt_j_07');
            $table->integer('falt_j_08');
            $table->integer('falt_j_09');
            $table->integer('falt_j_10');
            $table->integer('falt_j_11');
            $table->integer('falt_j_12');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('falta');
    }
}
