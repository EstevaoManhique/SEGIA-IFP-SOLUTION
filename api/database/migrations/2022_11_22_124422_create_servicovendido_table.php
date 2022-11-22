<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateServicovendidoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('servicovendido', function (Blueprint $table) {
            $table->integer('srv_id', true);
            $table->boolean('encrypted');
            $table->double('srv_desconto');
            $table->integer('srv_qtd');
            $table->double('srv_total');
            $table->integer('entidade_enti_id')->nullable()->index('FK_eij7ug2pvmknod4fnfas1x2wd');
            $table->integer('factura_fact_id')->nullable()->index('FK_oq1uxe1boyqak2jmaulagu563');
            $table->integer('servico_serv_id')->nullable()->index('FK_syb43bc82t8yjtpkjlb2d0lsw');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('servicovendido');
    }
}
