<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTipodespesaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tipodespesa', function (Blueprint $table) {
            $table->integer('tipd_id', true);
            $table->boolean('encrypted');
            $table->string('tipd_categoria')->nullable();
            $table->string('tipd_descricao')->nullable();
            $table->integer('tipd_numDespesas');
            $table->string('tipd_periodo')->nullable();
            $table->integer('tipd_tempo');
            $table->double('tipd_valorExectuado');
            $table->double('tipd_valorPlanificado');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_n8cv7fhwx682504n7e84s1abm');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tipodespesa');
    }
}
