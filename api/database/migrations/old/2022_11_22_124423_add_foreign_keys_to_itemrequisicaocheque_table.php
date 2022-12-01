<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToItemrequisicaochequeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('itemrequisicaocheque', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_12197cy63f32t5lair2notisb')->references(['enti_id'])->on('entidade');
            $table->foreign(['requisicaoCheque_rqc_id'], 'FK_ewpabkfw2dqvp7tsk3cx5vnyg')->references(['rqc_id'])->on('requisicaocheque');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('itemrequisicaocheque', function (Blueprint $table) {
            $table->dropForeign('FK_12197cy63f32t5lair2notisb');
            $table->dropForeign('FK_ewpabkfw2dqvp7tsk3cx5vnyg');
        });
    }
}
