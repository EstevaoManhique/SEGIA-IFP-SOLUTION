<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDependenteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dependente', function (Blueprint $table) {
            $table->integer('dpn_id', true);
            $table->string('dpn_grau')->nullable();
            $table->string('dpn_nome')->nullable();
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_24wnkht2g6i5k24m07kxyd2ug');
            $table->integer('funcionario_func_id')->nullable()->index('FK_7qbhfckctc3jpv2acc94d8eco');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('dependente');
    }
}
