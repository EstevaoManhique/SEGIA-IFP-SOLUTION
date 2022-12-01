<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDepartamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('departamento', function (Blueprint $table) {
            $table->integer('dep_id', true);
            $table->string('dep_nome')->nullable();
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_a756kbm4bsk6qrt6xhapj7l30');
            $table->integer('administracao_adm_id')->nullable()->index('FK_eejspavkwhwuak1pq2uu3nssi');
            $table->integer('nivelPrioridade_nvp_id')->nullable()->index('FK_ntecai3lm5d1sa3ayu7ti3yo6');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('departamento');
    }
}
