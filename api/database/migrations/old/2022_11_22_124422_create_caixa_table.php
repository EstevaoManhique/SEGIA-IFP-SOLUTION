<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCaixaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('caixa', function (Blueprint $table) {
            $table->integer('caix_id', true);
            $table->string('caix_descricao')->nullable();
            $table->boolean('encrypted');
            $table->integer('departamento_dep_id')->nullable()->index('FK_2mu894nt40t16ldsyngkbgdiq');
            $table->integer('entidade_enti_id')->nullable()->index('FK_nltlbgf39bw31uim62xof7xom');
            $table->integer('usuario_usua_id')->nullable()->index('FK_84bo5166rmesb0lo963phjpq5');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('caixa');
    }
}
