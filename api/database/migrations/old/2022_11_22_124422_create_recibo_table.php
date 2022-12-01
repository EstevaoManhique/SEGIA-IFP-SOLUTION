<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReciboTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recibo', function (Blueprint $table) {
            $table->integer('rec_id', true);
            $table->boolean('encrypted');
            $table->dateTime('rec_data')->nullable();
            $table->bigInteger('rec_lancamento');
            $table->double('rec_mullta');
            $table->longText('rec_observacoes')->nullable();
            $table->string('rec_recebemosDe')->nullable();
            $table->string('rec_referencia')->nullable();
            $table->double('rec_total');
            $table->double('rec_valor');
            $table->string('ref_bancoPagamento')->nullable();
            $table->string('ref_nrDocumentoPagamento')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_een6cvnfnmhsu7a1fr28gwdoh');
            $table->integer('factura_fact_id')->nullable()->index('FK_qwr1eh0n82isctf14l2udpkpf');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_mruycpcwb5friinmuxpf2bg4l');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('recibo');
    }
}
