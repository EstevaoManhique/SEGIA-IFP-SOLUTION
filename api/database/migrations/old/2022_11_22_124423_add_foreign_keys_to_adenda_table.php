<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAdendaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('adenda', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_1dcxp4uiuydwbouseceykbg9i')->references(['enti_id'])->on('entidade');
            $table->foreign(['usuario2_usua_id'], 'FK_fuf7gv7dx8a2qmym7cgcsvsuq')->references(['usua_id'])->on('usuario');
            $table->foreign(['usuario_usua_id'], 'FK_m0wbiuqlirtddf0q9dkorb72')->references(['usua_id'])->on('usuario');
            $table->foreign(['usuario3_usua_id'], 'FK_752xlf1p4w319pbpnkrdn3yi1')->references(['usua_id'])->on('usuario');
            $table->foreign(['contrato_cont_id'], 'FK_kanbae4v9j5ibqvb289ghlyh3')->references(['cont_id'])->on('contrato');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('adenda', function (Blueprint $table) {
            $table->dropForeign('FK_1dcxp4uiuydwbouseceykbg9i');
            $table->dropForeign('FK_fuf7gv7dx8a2qmym7cgcsvsuq');
            $table->dropForeign('FK_m0wbiuqlirtddf0q9dkorb72');
            $table->dropForeign('FK_752xlf1p4w319pbpnkrdn3yi1');
            $table->dropForeign('FK_kanbae4v9j5ibqvb289ghlyh3');
        });
    }
}
