<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMensalidadeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mensalidade', function (Blueprint $table) {
            $table->integer('mens_id', true);
            $table->boolean('encrypted');
            $table->dateTime('mens_dataInscricao')->nullable();
            $table->dateTime('mens_dataPagamento')->nullable();
            $table->dateTime('mens_dataProximoPagamento')->nullable();
            $table->string('mens_estado')->nullable();
            $table->integer('aluno_alun_id')->nullable()->index('FK_4vprncqyqt1w7rcsqd809l8so');
            $table->integer('curso_curs_id')->nullable()->index('FK_rq9ygnvbbk6etbp9awc9kstfu');
            $table->integer('entidade_enti_id')->nullable()->index('FK_55drx7a8y9d0yjxfmivwcqxqj');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mensalidade');
    }
}
