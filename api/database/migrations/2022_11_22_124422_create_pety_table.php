<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePetyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pety', function (Blueprint $table) {
            $table->integer('pety_id', true);
            $table->boolean('encrypted');
            $table->string('pety_periodo')->nullable();
            $table->double('pety_valorrestante');
            $table->double('pety_valortotal');
            $table->integer('entidade_enti_id')->nullable()->index('FK_iv3p9fufx82ldaso32d8ap72q');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pety');
    }
}
