<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAproveitamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('aproveitamento', function (Blueprint $table) {
            $table->integer('apro_id', true);
            $table->integer('apro_admitidos');
            $table->string('apro_ano')->nullable();
            $table->string('apro_categoria')->nullable();
            $table->integer('apro_dispensados');
            $table->integer('apro_exames');
            $table->integer('apro_excluidos');
            $table->integer('apro_reprovados');
            $table->string('cod_escola')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('aproveitamento');
    }
}
