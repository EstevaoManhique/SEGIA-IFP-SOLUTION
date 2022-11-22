<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnolectivoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('anolectivo', function (Blueprint $table) {
            $table->integer('anol_id', true);
            $table->boolean('anol_corrente');
            $table->string('anol_descricao')->nullable();
            $table->string('anol_status')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_frxat7s9w6gnsrjfp5xy1av0b');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('anolectivo');
    }
}
