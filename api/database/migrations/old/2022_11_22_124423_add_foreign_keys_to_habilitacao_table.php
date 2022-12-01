<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToHabilitacaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('habilitacao', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_mpwhy6rc2ob5q7q5ksors7ij4')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('habilitacao', function (Blueprint $table) {
            $table->dropForeign('FK_mpwhy6rc2ob5q7q5ksors7ij4');
        });
    }
}
