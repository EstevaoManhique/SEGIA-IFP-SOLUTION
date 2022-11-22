<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFornecedorTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fornecedor', function (Blueprint $table) {
            $table->integer('for_id', true);
            $table->boolean('encrypted');
            $table->string('for_contaGeral')->nullable();
            $table->string('for_contacto')->nullable();
            $table->string('for_email')->nullable();
            $table->string('for_endereco')->nullable();
            $table->string('for_nome')->nullable();
            $table->bigInteger('for_nuit');
            $table->integer('entidade_enti_id')->nullable()->index('FK_htg20ra8oqcm3h9gc5vr4uybj');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('fornecedor');
    }
}
