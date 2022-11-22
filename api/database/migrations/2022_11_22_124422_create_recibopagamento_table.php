<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecibopagamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recibopagamento', function (Blueprint $table) {
            $table->integer('recp_id', true);
            $table->boolean('encrypted');
            $table->dateTime('recp_data')->nullable();
            $table->bigInteger('recp_lancamento');
            $table->double('recp_multa');
            $table->longText('recp_observacoes')->nullable();
            $table->string('recp_recebemosDe')->nullable();
            $table->string('recp_referencia')->nullable();
            $table->double('recp_total');
            $table->double('recp_valor');
            $table->string('ref_bancoPagamento')->nullable();
            $table->string('ref_nrDocumentoPagamento')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_a5nlf4y0qhcurr6q4vn8ebfym');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_a9twha88ftu3gf0x0966lj23x');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('recibopagamento');
    }
}
