<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAreaformacaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('areaformacao', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_4w1f237uce4cil3kbi8851nvx')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('areaformacao', function (Blueprint $table) {
            $table->dropForeign('FK_4w1f237uce4cil3kbi8851nvx');
        });
    }
}
