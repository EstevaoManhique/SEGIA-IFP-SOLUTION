<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePresencasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('presencas', function (Blueprint $table) {
            $table->integer('pres_id', true);
            $table->boolean('encrypted');
            $table->dateTime('pres_data')->nullable();
            $table->integer('pres_faltas');
            $table->integer('aluno_alun_id')->nullable()->index('FK_1s86gw2gw3q1m1mob9nmndn4t');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_jrbwgptv6250nuxyvpvl4wfra');
            $table->integer('entidade_enti_id')->nullable()->index('FK_sdk292n9vboqcl0yhmt6kuwf3');
            $table->integer('turma_turm_id')->nullable()->index('FK_o16ns9ve81vtu7xcxhuj6cmqx');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('presencas');
    }
}
