<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToModulosusuariomarketTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('modulosusuariomarket', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_fn5lc3asuu38xwaddm5b79cvo')->references(['usua_id'])->on('usuario');
            $table->foreign(['entidade_enti_id'], 'FK_ibpxaq5rn7mikbprq7ejgmxf7')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('modulosusuariomarket', function (Blueprint $table) {
            $table->dropForeign('FK_fn5lc3asuu38xwaddm5b79cvo');
            $table->dropForeign('FK_ibpxaq5rn7mikbprq7ejgmxf7');
        });
    }
}
