<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVendaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('venda', function (Blueprint $table) {
            $table->integer('vend_id', true);
            $table->boolean('encrypted');
            $table->dateTime('vend_dataVenda')->nullable();
            $table->string('vend_descricao')->nullable();
            $table->string('vend_estado')->nullable();
            $table->string('vend_referencia')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_4d1gvvw6bq6yprwe5y6b2b2ws');
            $table->integer('cliente_clie_id')->nullable()->index('FK_ixrflhygeck3m49e55lrm4j3b');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('venda');
    }
}
