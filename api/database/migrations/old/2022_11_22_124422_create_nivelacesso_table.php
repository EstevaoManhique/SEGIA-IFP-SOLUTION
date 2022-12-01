<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNivelacessoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('nivelacesso', function (Blueprint $table) {
            $table->integer('niva_id', true);
            $table->boolean('encrypted');
            $table->string('niva_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_5rlfyqoopm3uj1020x77t1c8q');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('nivelacesso');
    }
}
