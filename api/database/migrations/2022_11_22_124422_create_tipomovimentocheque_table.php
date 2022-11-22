<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTipomovimentochequeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tipomovimentocheque', function (Blueprint $table) {
            $table->integer('tmc_id', true);
            $table->boolean('encrypted');
            $table->string('tmc_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_ffn2ll5h290u1vo473qdxk1r8');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tipomovimentocheque');
    }
}
