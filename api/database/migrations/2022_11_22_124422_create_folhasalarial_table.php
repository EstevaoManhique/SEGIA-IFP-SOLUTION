<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFolhasalarialTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('folhasalarial', function (Blueprint $table) {
            $table->integer('fls_id', true);
            $table->boolean('encrypted');
            $table->double('fls_IRPS');
            $table->double('fls_bonus');
            $table->double('fls_coeficiente');
            $table->dateTime('fls_data')->nullable();
            $table->double('fls_dependentes');
            $table->double('fls_desconto');
            $table->double('fls_limiteInferior');
            $table->string('fls_periodo')->nullable();
            $table->string('fls_referencia')->nullable();
            $table->double('fls_salario');
            $table->integer('entidade_enti_id')->nullable()->index('FK_53fqtis9ydqbgfg7gtge9afxl');
            $table->integer('funcionario_func_id')->nullable()->index('FK_4s3mlynr6yl3p8bxo09c4wgwx');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('folhasalarial');
    }
}
