<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCorTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cor', function (Blueprint $table) {
            $table->integer('cor_id', true);
            $table->string('cor_codigo')->nullable();
            $table->string('cor_codigoHexaDecimal')->nullable();
            $table->string('cor_nome')->nullable();
            $table->boolean('encrypted');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cor');
    }
}
