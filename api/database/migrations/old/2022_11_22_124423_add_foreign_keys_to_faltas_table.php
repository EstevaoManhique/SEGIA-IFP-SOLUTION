<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToFaltasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('faltas', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_hqjkt4f6b6kuyihe43fh2ok4v')->references(['enti_id'])->on('entidade');
            $table->foreign(['funcionario_func_id'], 'FK_s4jc3autodujjf41a380ejil8')->references(['func_id'])->on('funcionario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('faltas', function (Blueprint $table) {
            $table->dropForeign('FK_hqjkt4f6b6kuyihe43fh2ok4v');
            $table->dropForeign('FK_s4jc3autodujjf41a380ejil8');
        });
    }
}
