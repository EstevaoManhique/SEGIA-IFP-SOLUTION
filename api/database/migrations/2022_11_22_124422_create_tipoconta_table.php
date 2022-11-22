<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTipocontaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tipoconta', function (Blueprint $table) {
            $table->integer('tip_id', true);
            $table->boolean('encrypted');
            $table->string('tip_nome')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_2swysbcfpbq0kyrvrhk8l9o99');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tipoconta');
    }
}
