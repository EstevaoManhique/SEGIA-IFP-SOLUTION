<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCondicaopagamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('condicaopagamento', function (Blueprint $table) {
            $table->integer('conp_id', true);
            $table->longText('conp_descricao')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_jd8q8vknvxr8bglmvepxv6j6d');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('condicaopagamento');
    }
}
