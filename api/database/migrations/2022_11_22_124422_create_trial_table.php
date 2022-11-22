<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTrialTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('trial', function (Blueprint $table) {
            $table->integer('tria_id', true);
            $table->dateTime('tria_fimTrial')->nullable();
            $table->dateTime('tria_inicioTrial')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_2pi6vfkw2ux50mxrqpqotsc1f');
            $table->integer('sistema_sist_id')->nullable()->index('FK_6o75t58ve3g3lmc53y8uo2arl');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('trial');
    }
}
