<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClienteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cliente', function (Blueprint $table) {
            $table->integer('clie_id', true);
            $table->string('clie_categoria')->nullable();
            $table->string('clie_contaGeral')->nullable();
            $table->string('clie_funcao')->nullable();
            $table->integer('clie_nid');
            $table->double('clie_saldoCredito');
            $table->double('clie_saldoDebito');
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_10brqolm3gt59gcakn2o146u0');
            $table->integer('pessoapess_pess_id')->nullable()->index('FK_3d8yf1m8qy81ovurrtetgubve');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cliente');
    }
}
