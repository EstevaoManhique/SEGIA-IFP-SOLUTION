<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToFeriasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ferias', function (Blueprint $table) {
            $table->foreign(['funcionario_func_id'], 'FK_7ogq58mmtmp7gx5g142ds318k')->references(['func_id'])->on('funcionario');
            $table->foreign(['Entidade_enti_id'], 'FK_kud22pc3xtvpc82tvof058f05')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('ferias', function (Blueprint $table) {
            $table->dropForeign('FK_7ogq58mmtmp7gx5g142ds318k');
            $table->dropForeign('FK_kud22pc3xtvpc82tvof058f05');
        });
    }
}
