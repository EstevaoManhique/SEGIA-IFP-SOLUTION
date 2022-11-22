<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToPetycashTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('petycash', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_9m9qm0m3h894fd2ttfad9br3q')->references(['usua_id'])->on('usuario');
            $table->foreign(['pety_pety_id'], 'FK_ltkehpnnjldfkdcs956udkaph')->references(['pety_id'])->on('pety');
            $table->foreign(['funcionario_func_id'], 'FK_dk2s8208hgpkswub1mw8ijbsu')->references(['func_id'])->on('funcionario');
            $table->foreign(['entidade_enti_id'], 'FK_orvmwxycgqy4xmatsyu7gwr88')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('petycash', function (Blueprint $table) {
            $table->dropForeign('FK_9m9qm0m3h894fd2ttfad9br3q');
            $table->dropForeign('FK_ltkehpnnjldfkdcs956udkaph');
            $table->dropForeign('FK_dk2s8208hgpkswub1mw8ijbsu');
            $table->dropForeign('FK_orvmwxycgqy4xmatsyu7gwr88');
        });
    }
}
