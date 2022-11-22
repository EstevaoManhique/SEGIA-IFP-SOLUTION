<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToModuloTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('modulo', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_35wc18gb5q0mek2vgauchahr')->references(['enti_id'])->on('entidade');
            $table->foreign(['curso_curs_id'], 'FK_adl9w4cemnv5u8vaows0dsgi4')->references(['curs_id'])->on('curso');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('modulo', function (Blueprint $table) {
            $table->dropForeign('FK_35wc18gb5q0mek2vgauchahr');
            $table->dropForeign('FK_adl9w4cemnv5u8vaows0dsgi4');
        });
    }
}
