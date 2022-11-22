<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContageralTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contageral', function (Blueprint $table) {
            $table->integer('ctg_id', true);
            $table->string('ctg_conta')->nullable();
            $table->string('ctg_descricao')->nullable();
            $table->boolean('ctg_raiz');
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_qf5yrej3obl5admbo3k1c50gu');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contageral');
    }
}
