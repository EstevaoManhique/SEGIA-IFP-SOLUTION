<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePdfTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pdf', function (Blueprint $table) {
            $table->integer('pdf_id', true);
            $table->boolean('encrypted');
            $table->dateTime('pdf_data')->nullable();
            $table->string('pdf_descricaoDocumento')->nullable();
            $table->string('pdf_hora')->nullable();
            $table->string('pdf_nomeDocumento')->nullable();
            $table->string('pdf_subPath')->nullable();
            $table->string('pdf_tipoDocumento')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_dixllrvenrnav3xhbvxafw4k7');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pdf');
    }
}
