<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDisciplinadocenteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('disciplinadocente', function (Blueprint $table) {
            $table->integer('disd_id', true);
            $table->integer('disciplina_disc_id')->nullable()->index('FK_kg4evqx1x2qw882martam55or');
            $table->integer('docente_doce_id')->nullable()->index('FK_a3myhb0nm58vso67pghet6h1');
            $table->integer('entidade_enti_id')->nullable()->index('FK_4hio7nrflk1nhjkrjanf6ncvv');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('disciplinadocente');
    }
}
