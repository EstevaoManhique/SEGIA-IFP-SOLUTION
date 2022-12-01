<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToModulousuarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('modulousuario', function (Blueprint $table) {
            $table->foreign(['moduloAcesso_moac_id'], 'FK_84t0hynggh54oqmn0mt2hax6o')->references(['moac_id'])->on('moduloacesso');
            $table->foreign(['usuario_usua_id'], 'FK_hxhp0fppiir6fjjdfk6cpig11')->references(['usua_id'])->on('usuario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('modulousuario', function (Blueprint $table) {
            $table->dropForeign('FK_84t0hynggh54oqmn0mt2hax6o');
            $table->dropForeign('FK_hxhp0fppiir6fjjdfk6cpig11');
        });
    }
}
