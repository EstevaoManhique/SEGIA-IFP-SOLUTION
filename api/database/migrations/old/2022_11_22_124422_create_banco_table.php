<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBancoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('banco', function (Blueprint $table) {
            $table->integer('bnc_id', true);
            $table->string('bnc_conta')->nullable();
            $table->string('bnc_logo')->nullable();
            $table->string('bnc_moeda')->nullable();
            $table->string('bnc_nib')->nullable();
            $table->string('bnc_nome')->nullable();
            $table->double('bnc_saldo');
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_47jyd7i2oqfr8g2w6320q8ujh');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('banco');
    }
}
