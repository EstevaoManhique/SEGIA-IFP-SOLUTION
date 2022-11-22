<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFuncionarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('funcionario', function (Blueprint $table) {
            $table->integer('func_id', true);
            $table->boolean('encrypted');
            $table->string('func_badgnumber')->nullable();
            $table->string('func_conta')->nullable();
            $table->dateTime('func_dataAdmissao')->nullable();
            $table->dateTime('func_dataValidade')->nullable();
            $table->integer('func_dependentes');
            $table->string('func_formaPagamento')->nullable();
            $table->string('func_nib')->nullable();
            $table->integer('func_numero')->nullable();
            $table->double('func_salario');
            $table->double('func_salario_dia');
            $table->double('func_salario_hora');
            $table->string('func_segurancaSocial')->nullable();
            $table->string('func_tipo')->nullable();
            $table->string('func_tipoContrato')->nullable();
            $table->integer('func_turno');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_asduo33c7kpj1pu8m53bgo21k');
            $table->integer('cargo_car_id')->nullable()->index('FK_8hbn26lkhmttkvj53456jqinf');
            $table->integer('departamento_dep_id')->nullable()->index('FK_7enln7j79flqeno2m1akdtvib');
            $table->integer('firmafirm_firm_id')->nullable()->index('FK_7iig7u2dakc9dqvtqfako35rv');
            $table->integer('habilitacao_habi_id')->nullable()->index('FK_mm6nma58ue2cyv16pqjr7j0gb');
            $table->integer('pessoapess_pess_id')->nullable()->index('FK_gvnobskteqgnk8i1tf3e80bqy');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('funcionario');
    }
}
