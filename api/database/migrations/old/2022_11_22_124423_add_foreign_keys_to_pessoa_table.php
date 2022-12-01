<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToPessoaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('pessoa', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_nagwq4oa5q56x94iak41d0v3e')->references(['enti_id'])->on('entidade');
            $table->foreign(['nacionalidadenaci_naci_id'], 'FK_sgqnd7nxdd12e55k3xchh6m69')->references(['naci_id'])->on('nacionalidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('pessoa', function (Blueprint $table) {
            $table->dropForeign('FK_nagwq4oa5q56x94iak41d0v3e');
            $table->dropForeign('FK_sgqnd7nxdd12e55k3xchh6m69');
        });
    }
}
