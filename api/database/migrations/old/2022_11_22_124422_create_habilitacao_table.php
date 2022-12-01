<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHabilitacaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('habilitacao', function (Blueprint $table) {
            $table->integer('habi_id', true);
            $table->boolean('encrypted');
            $table->string('habi_descricao')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_mpwhy6rc2ob5q7q5ksors7ij4');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('habilitacao');
    }
}
