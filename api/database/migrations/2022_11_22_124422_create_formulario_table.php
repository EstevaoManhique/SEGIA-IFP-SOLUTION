<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormularioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('formulario', function (Blueprint $table) {
            $table->integer('form_id', true);
            $table->string('form_descricao')->nullable();
            $table->string('form_referencia')->nullable();
            $table->integer('sistema_sist_id')->nullable()->index('FK_oax4s6ao8ok58c0a14xdkh5ll');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('formulario');
    }
}
