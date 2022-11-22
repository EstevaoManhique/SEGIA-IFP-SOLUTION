<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRespostaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('resposta', function (Blueprint $table) {
            $table->integer('resp_id', true);
            $table->boolean('encrypted');
            $table->string('resp_categoria')->nullable();
            $table->longText('resp_opcao1')->nullable();
            $table->longText('resp_opcao2')->nullable();
            $table->longText('resp_opcao3')->nullable();
            $table->longText('resp_opcao4')->nullable();
            $table->longText('resp_pergunta')->nullable();
            $table->double('resp_pontuacao');
            $table->longText('resp_resposta')->nullable();
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_efvyvoswphpmjlxn4lsmvdqlb');
            $table->integer('curso_curs_id')->nullable()->index('FK_2q2weqltc8r1nrok80c1ydqq8');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_mymag3ipaad3ocoat8eqjns87');
            $table->integer('entidade_enti_id')->nullable()->index('FK_meoamw39mpd1o6sp7m1dlu0bv');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('resposta');
    }
}
