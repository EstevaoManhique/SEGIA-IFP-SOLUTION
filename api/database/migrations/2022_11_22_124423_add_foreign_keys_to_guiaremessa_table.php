<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToGuiaremessaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('guiaremessa', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_o9jkf50bybenc11pbgs2wofgs')->references(['enti_id'])->on('entidade');
            $table->foreign(['cliente_clie_id'], 'FK_2ccv55iw83bna0crobsh1xcxw')->references(['clie_id'])->on('cliente');
            $table->foreign(['fornecedor_for_id'], 'FK_fgm9y04ssd5yjyvd3r8e9kcog')->references(['for_id'])->on('fornecedor');
            $table->foreign(['factura_fact_id'], 'FK_l4exrkq98om6k1mhr9k688uls')->references(['fact_id'])->on('factura');
            $table->foreign(['usuario2_usua_id'], 'FK_3pa1ddgb0c6u7r5o3jcpn7jw9')->references(['usua_id'])->on('usuario');
            $table->foreign(['usuario_usua_id'], 'FK_l40btg65x6s39xpu7f6q3ojsq')->references(['usua_id'])->on('usuario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('guiaremessa', function (Blueprint $table) {
            $table->dropForeign('FK_o9jkf50bybenc11pbgs2wofgs');
            $table->dropForeign('FK_2ccv55iw83bna0crobsh1xcxw');
            $table->dropForeign('FK_fgm9y04ssd5yjyvd3r8e9kcog');
            $table->dropForeign('FK_l4exrkq98om6k1mhr9k688uls');
            $table->dropForeign('FK_3pa1ddgb0c6u7r5o3jcpn7jw9');
            $table->dropForeign('FK_l40btg65x6s39xpu7f6q3ojsq');
        });
    }
}
