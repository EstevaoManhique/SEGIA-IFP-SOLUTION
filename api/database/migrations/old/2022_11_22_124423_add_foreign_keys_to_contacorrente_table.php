<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToContacorrenteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('contacorrente', function (Blueprint $table) {
            $table->foreign(['cliente_clie_id'], 'FK_14l1faakxfivcksjppmw695x4')->references(['clie_id'])->on('cliente');
            $table->foreign(['entidade_enti_id'], 'FK_pnihc8swojf73k4mvlu7bnsm4')->references(['enti_id'])->on('entidade');
            $table->foreign(['usuario_usua_id'], 'FK_70irf027dlsm901xfflndo8m1')->references(['usua_id'])->on('usuario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('contacorrente', function (Blueprint $table) {
            $table->dropForeign('FK_14l1faakxfivcksjppmw695x4');
            $table->dropForeign('FK_pnihc8swojf73k4mvlu7bnsm4');
            $table->dropForeign('FK_70irf027dlsm901xfflndo8m1');
        });
    }
}
