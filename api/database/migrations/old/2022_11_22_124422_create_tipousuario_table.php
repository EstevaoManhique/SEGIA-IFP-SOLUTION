<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTipousuarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tipousuario', function (Blueprint $table) {
            $table->integer('tipu_id', true);
            $table->boolean('encrypted');
            $table->string('tipu_descricao')->nullable();
            $table->integer('nivelAcessoniva_niva_id')->nullable()->index('FK_e5h1x62vnbq7ts4geevumdr29');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tipousuario');
    }
}
