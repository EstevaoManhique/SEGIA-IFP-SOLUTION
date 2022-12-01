<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAreaformacaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('areaformacao', function (Blueprint $table) {
            $table->integer('aref_id', true);
            $table->string('aref_descricao')->nullable();
            $table->longText('aref_detalhes')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_4w1f237uce4cil3kbi8851nvx');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('areaformacao');
    }
}
