<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTipopagamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tipopagamento', function (Blueprint $table) {
            $table->integer('tipa_id', true);
            $table->boolean('encrypted');
            $table->string('tipa_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_8hq7mqd70c8y7irqiyp4corde');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tipopagamento');
    }
}
