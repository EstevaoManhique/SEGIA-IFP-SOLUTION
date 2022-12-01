<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExtractoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('extracto', function (Blueprint $table) {
            $table->integer('ext_id', true);
            $table->boolean('encrypted');
            $table->double('ext_credito');
            $table->date('ext_data')->nullable();
            $table->double('ext_debito');
            $table->string('ext_movimento')->nullable();
            $table->double('ext_saldo');
            $table->integer('entidade_enti_id')->nullable()->index('FK_ccf1yuw773xr9tltok1h48hf');
            $table->integer('factura_fact_id')->nullable()->index('FK_a4mmrye6vdk99babdgo11611r');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('extracto');
    }
}
