<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTemaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tema', function (Blueprint $table) {
            $table->integer('tema_id', true);
            $table->boolean('encrypted');
            $table->longText('tema_descricao')->nullable();
            $table->integer('tema_pratica');
            $table->integer('tema_teorica');
            $table->integer('curso_curs_id')->nullable()->index('FK_q6awj9i9f0vena7vmnqvfa8q8');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_433hyqi59ej4b18urfh55ibwc');
            $table->integer('entidade_enti_id')->nullable()->index('FK_wvu5tm95abblay70mpfsd0tw');
            $table->integer('escola_esc_id')->nullable()->index('FK_mwlxog9vafn3tnjspa8b2wqua');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tema');
    }
}
