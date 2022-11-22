<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToDisciplinaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('disciplina', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_grsg69oau24l68e1anxnohfow')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('disciplina', function (Blueprint $table) {
            $table->dropForeign('FK_grsg69oau24l68e1anxnohfow');
        });
    }
}
