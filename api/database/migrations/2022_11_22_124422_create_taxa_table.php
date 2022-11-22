<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTaxaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('taxa', function (Blueprint $table) {
            $table->integer('taxa_id', true);
            $table->boolean('encrypted');
            $table->string('taxa_descricao')->nullable();
            $table->double('taxa_valor');
            $table->integer('entidade_enti_id')->nullable()->index('FK_tg5ij935hkthgihs7v7uou4al');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('taxa');
    }
}
