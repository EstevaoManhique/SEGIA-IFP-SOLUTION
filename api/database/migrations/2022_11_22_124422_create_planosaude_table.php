<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlanosaudeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('planosaude', function (Blueprint $table) {
            $table->integer('pls_id', true);
            $table->boolean('encrypted');
            $table->string('pls_avaliacao')->nullable();
            $table->dateTime('pls_data')->nullable();
            $table->string('pls_descricao')->nullable();
            $table->string('pls_medico')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_9vny1fyrci8v5cdcqlwqrnovr');
            $table->integer('funcionario_func_id')->nullable()->index('FK_rg0xllsi66v9golf1n1pa53y');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('planosaude');
    }
}
