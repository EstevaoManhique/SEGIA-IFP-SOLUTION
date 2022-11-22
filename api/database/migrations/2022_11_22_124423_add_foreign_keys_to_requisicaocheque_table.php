<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToRequisicaochequeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('requisicaocheque', function (Blueprint $table) {
            $table->foreign(['funcionario_func_id'], 'FK_368l0h722rhcf58hyaodn7v70')->references(['func_id'])->on('funcionario');
            $table->foreign(['usuario_usua_id'], 'FK_hqdc0yqgj4xhim1y67130pu1b')->references(['usua_id'])->on('usuario');
            $table->foreign(['entidade_enti_id'], 'FK_78crg2eren4brq6s86t1mfk1g')->references(['enti_id'])->on('entidade');
            $table->foreign(['tipoMovimentoCheque_tmc_id'], 'FK_sfn6anbmwqw1g12vn474lgr3w')->references(['tmc_id'])->on('tipomovimentocheque');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('requisicaocheque', function (Blueprint $table) {
            $table->dropForeign('FK_368l0h722rhcf58hyaodn7v70');
            $table->dropForeign('FK_hqdc0yqgj4xhim1y67130pu1b');
            $table->dropForeign('FK_78crg2eren4brq6s86t1mfk1g');
            $table->dropForeign('FK_sfn6anbmwqw1g12vn474lgr3w');
        });
    }
}
