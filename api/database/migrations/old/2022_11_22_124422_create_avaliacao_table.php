<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAvaliacaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('avaliacao', function (Blueprint $table) {
            $table->integer('aval_id', true);
            $table->integer('aval_anoLectivo');
            $table->string('aval_comportamento')->nullable();
            $table->string('aval_observacoes')->nullable();
            $table->string('aval_semestre')->nullable();
            $table->boolean('encrypted');
            $table->integer('aluno_alun_id')->nullable()->index('FK_avqgkwb66f9siw8injhgo9nhl');
            $table->integer('entidade_enti_id')->nullable()->index('FK_mcyawqa1dsvq17stmpkitaet4');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('avaliacao');
    }
}
