<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEscolaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('escola', function (Blueprint $table) {
            $table->integer('esc_id', true);
            $table->string('cod_escola')->nullable();
            $table->integer('esc_alunos');
            $table->integer('esc_alunos_homens');
            $table->integer('esc_alunos_mulheres');
            $table->integer('esc_alunos_necessitados');
            $table->string('esc_contacto')->nullable();
            $table->string('esc_descricao')->nullable();
            $table->string('esc_distrito')->nullable();
            $table->integer('esc_docentes');
            $table->string('esc_endereco')->nullable();
            $table->integer('esc_faixa_05');
            $table->integer('esc_faixa_1115');
            $table->integer('esc_faixa_1625');
            $table->integer('esc_faixa_2635');
            $table->integer('esc_faixa_35');
            $table->integer('esc_faixa_610');
            $table->integer('esc_membros_homens');
            $table->integer('esc_membros_mulheres');
            $table->string('esc_provincia')->nullable();
            $table->integer('esc_salas');
            $table->double('esc_saldo');
            $table->integer('esc_turmas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('escola');
    }
}
