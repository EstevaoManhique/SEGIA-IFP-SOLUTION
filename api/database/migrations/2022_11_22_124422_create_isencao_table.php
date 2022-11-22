<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIsencaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('isencao', function (Blueprint $table) {
            $table->integer('isen_id', true);
            $table->boolean('encrypted');
            $table->string('isen_codigo')->nullable();
            $table->longText('isen_descricao')->nullable();
            $table->longText('isen_detalhes')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_mcx522b08kyjqksylpusbuu01');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('isencao');
    }
}
