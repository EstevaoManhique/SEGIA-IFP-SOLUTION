<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToCursoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('curso', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_5oh9yrcu7v3hvcwfbs14acxrg')->references(['enti_id'])->on('entidade');
            $table->foreign(['areaFormacao_aref_id'], 'FK_bkd5vu4xxqy225d2o6xnlgq8a')->references(['aref_id'])->on('areaformacao');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('curso', function (Blueprint $table) {
            $table->dropForeign('FK_5oh9yrcu7v3hvcwfbs14acxrg');
            $table->dropForeign('FK_bkd5vu4xxqy225d2o6xnlgq8a');
        });
    }
}
