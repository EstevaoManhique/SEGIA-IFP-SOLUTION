<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateActaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('acta', function (Blueprint $table) {
            $table->integer('acta_id', true);
            $table->dateTime('acta_data')->nullable();
            $table->longText('acta_descricao')->nullable();
            $table->string('acta_referencia')->nullable();
            $table->integer('convocatoria_conv_id')->nullable()->index('FK_jdk8fs8ddg0l1audjacebf9ni');
            $table->integer('entidade_enti_id')->nullable()->index('FK_rdggjixm1br6m0q43qppai9ec');
            $table->integer('escola_esc_id')->nullable()->index('FK_ikxryj1skdd6myt9vg56s3l3p');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('acta');
    }
}
