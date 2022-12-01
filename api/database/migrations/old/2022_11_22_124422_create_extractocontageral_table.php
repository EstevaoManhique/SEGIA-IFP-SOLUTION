<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExtractocontageralTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('extractocontageral', function (Blueprint $table) {
            $table->integer('extc_id', true);
            $table->boolean('encrypted');
            $table->double('extc_credito');
            $table->date('extc_data')->nullable();
            $table->double('extc_debito');
            $table->longText('extc_movimento')->nullable();
            $table->string('extc_referencia')->nullable();
            $table->integer('contaGeral_ctg_id')->nullable()->index('FK_19gkfusc1nfoicys516judg7m');
            $table->integer('entidade_enti_id')->nullable()->index('FK_k4i70e28jhu9nia1xn6bjhc6j');
            $table->integer('lancamento_lan_id')->nullable()->index('FK_k358qt33e6loreuv1jnmnncib');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('extractocontageral');
    }
}
