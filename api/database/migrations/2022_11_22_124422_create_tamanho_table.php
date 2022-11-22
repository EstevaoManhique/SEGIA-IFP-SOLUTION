<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTamanhoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tamanho', function (Blueprint $table) {
            $table->integer('tam_id', true);
            $table->boolean('encrypted');
            $table->string('tam_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_408o2i3odp2h524j7iteb3cw6');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tamanho');
    }
}
