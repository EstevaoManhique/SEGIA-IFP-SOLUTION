<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateModuloTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('modulo', function (Blueprint $table) {
            $table->integer('modu_id', true);
            $table->boolean('encrypted');
            $table->double('modu_credito');
            $table->string('modu_descricao')->nullable();
            $table->integer('modu_durcao');
            $table->double('modu_preco');
            $table->integer('curso_curs_id')->nullable()->index('FK_adl9w4cemnv5u8vaows0dsgi4');
            $table->integer('entidade_enti_id')->nullable()->index('FK_35wc18gb5q0mek2vgauchahr');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('modulo');
    }
}
