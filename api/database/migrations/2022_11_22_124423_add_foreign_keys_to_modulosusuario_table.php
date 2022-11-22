<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToModulosusuarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('modulosusuario', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_5nnpix6in7o42ph0bxrxofc18')->references(['usua_id'])->on('usuario');
            $table->foreign(['entidade_enti_id'], 'FK_lpxi2bq9hq5esqwyk3y8vr7vh')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('modulosusuario', function (Blueprint $table) {
            $table->dropForeign('FK_5nnpix6in7o42ph0bxrxofc18');
            $table->dropForeign('FK_lpxi2bq9hq5esqwyk3y8vr7vh');
        });
    }
}
