<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlanodecontaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('planodeconta', function (Blueprint $table) {
            $table->integer('pdc_id', true);
            $table->boolean('encrypted');
            $table->string('pdc_codigo')->nullable();
            $table->string('pdc_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_m0js5l1tb10ewts4u63mh0qre');
            $table->integer('planoDeConta_pdc_id')->nullable()->index('FK_jkqiofgh5a5sp15sf2h4fkwix');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('planodeconta');
    }
}
