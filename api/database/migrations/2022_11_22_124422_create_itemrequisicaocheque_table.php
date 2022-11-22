<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateItemrequisicaochequeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('itemrequisicaocheque', function (Blueprint $table) {
            $table->integer('irc_id', true);
            $table->boolean('encrypted');
            $table->string('irc_beneficiario')->nullable();
            $table->integer('irc_ref');
            $table->double('irc_valor');
            $table->integer('entidade_enti_id')->nullable()->index('FK_12197cy63f32t5lair2notisb');
            $table->integer('requisicaoCheque_rqc_id')->nullable()->index('FK_ewpabkfw2dqvp7tsk3cx5vnyg');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('itemrequisicaocheque');
    }
}
