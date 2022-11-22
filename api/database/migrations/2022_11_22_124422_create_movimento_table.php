<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMovimentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('movimento', function (Blueprint $table) {
            $table->integer('mov_id', true);
            $table->boolean('encrypted');
            $table->string('mov_benefeciario')->nullable();
            $table->double('mov_credito');
            $table->dateTime('mov_data')->nullable();
            $table->dateTime('mov_dataEmissao')->nullable();
            $table->double('mov_debito');
            $table->longText('mov_detalhes')->nullable();
            $table->string('mov_nrCheque')->nullable();
            $table->string('mov_referencia')->nullable();
            $table->double('mov_saldo');
            $table->integer('banco_bnc_id')->nullable()->index('FK_r01a5wotlfpfssovpw16olj6f');
            $table->integer('entidade_enti_id')->nullable()->index('FK_16gy57vr9j4vlabrkkaf5yonr');
            $table->integer('usuario_usua_id')->nullable()->index('FK_dm0ob0oesk0xfe2qmggquu371');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('movimento');
    }
}
