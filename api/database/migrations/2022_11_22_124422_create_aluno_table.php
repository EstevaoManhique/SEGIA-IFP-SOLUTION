<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAlunoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('aluno', function (Blueprint $table) {
            $table->integer('alun_id', true);
            $table->string('alun_badgnumber')->nullable();
            $table->string('alun_bolseiro')->nullable();
            $table->string('alun_categoria')->nullable();
            $table->dateTime('alun_dataInscricao')->nullable();
            $table->dateTime('alun_dataProximoPagamento')->nullable();
            $table->boolean('alun_deficiente');
            $table->string('alun_distrito')->nullable();
            $table->string('alun_nivel')->nullable();
            $table->string('alun_password')->nullable();
            $table->string('alun_provincia')->nullable();
            $table->string('alun_status')->nullable();
            $table->integer('alun_turno');
            $table->string('alun_unico')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_kbjdu10dy3f1mmvnruhhnbmbi');
            $table->integer('escola_esc_id')->nullable()->index('FK_8lki430ac35iaf284bhyll6xj');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_ai5syhs7i5hit0uifd43a4qje');
            $table->integer('turma_turm_id')->nullable()->index('FK_7dkxvmvikn17q78r35w1odj7q');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('aluno');
    }
}
