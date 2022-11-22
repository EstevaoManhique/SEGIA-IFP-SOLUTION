<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToPlanosaudeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('planosaude', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_9vny1fyrci8v5cdcqlwqrnovr')->references(['enti_id'])->on('entidade');
            $table->foreign(['funcionario_func_id'], 'FK_rg0xllsi66v9golf1n1pa53y')->references(['func_id'])->on('funcionario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('planosaude', function (Blueprint $table) {
            $table->dropForeign('FK_9vny1fyrci8v5cdcqlwqrnovr');
            $table->dropForeign('FK_rg0xllsi66v9golf1n1pa53y');
        });
    }
}
