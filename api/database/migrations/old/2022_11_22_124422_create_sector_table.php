<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSectorTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sector', function (Blueprint $table) {
            $table->integer('sec_id', true);
            $table->boolean('encrypted');
            $table->string('sec_nome')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_9svfi4tow0gol9ux1d12rgxqy');
            $table->integer('departamento_dep_id')->nullable()->index('FK_stiowgwspplgtscn7wxteio8r');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sector');
    }
}
