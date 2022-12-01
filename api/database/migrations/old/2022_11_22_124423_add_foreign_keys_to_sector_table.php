<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToSectorTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('sector', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_9svfi4tow0gol9ux1d12rgxqy')->references(['enti_id'])->on('entidade');
            $table->foreign(['departamento_dep_id'], 'FK_stiowgwspplgtscn7wxteio8r')->references(['dep_id'])->on('departamento');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('sector', function (Blueprint $table) {
            $table->dropForeign('FK_9svfi4tow0gol9ux1d12rgxqy');
            $table->dropForeign('FK_stiowgwspplgtscn7wxteio8r');
        });
    }
}
