<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToDocenteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('docente', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_43lkif5xlit28rml5m1tdgr5a')->references(['enti_id'])->on('entidade');
            $table->foreign(['pessoa_pess_id'], 'FK_qn8muyudxkb50x3vpnebqkrwi')->references(['pess_id'])->on('pessoa');
            $table->foreign(['areaFormacao_aref_id'], 'FK_ataa0n6q7saq8j56lf0toywre')->references(['aref_id'])->on('areaformacao');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('docente', function (Blueprint $table) {
            $table->dropForeign('FK_43lkif5xlit28rml5m1tdgr5a');
            $table->dropForeign('FK_qn8muyudxkb50x3vpnebqkrwi');
            $table->dropForeign('FK_ataa0n6q7saq8j56lf0toywre');
        });
    }
}
