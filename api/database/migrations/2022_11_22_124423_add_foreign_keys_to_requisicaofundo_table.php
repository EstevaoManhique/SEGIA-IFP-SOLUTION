<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToRequisicaofundoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('requisicaofundo', function (Blueprint $table) {
            $table->foreign(['contrato_cont_id'], 'FK_tfedl3oltb9o8eovef5efsc66')->references(['cont_id'])->on('contrato');
            $table->foreign(['usuario4_usua_id'], 'FK_7a9d4b25td2bijvdrupoxcv2m')->references(['usua_id'])->on('usuario');
            $table->foreign(['entidade_enti_id'], 'FK_8vvou31981olxqv7d40psh6m2')->references(['enti_id'])->on('entidade');
            $table->foreign(['usuario3_usua_id'], 'FK_sdwxlng1jw3w633jmrg2oa9ic')->references(['usua_id'])->on('usuario');
            $table->foreign(['usuario2_usua_id'], 'FK_7jqsyys08pv6isl6b7yb9xre0')->references(['usua_id'])->on('usuario');
            $table->foreign(['usuario_usua_id'], 'FK_eolskwf9et44ahtpr0t2nbgad')->references(['usua_id'])->on('usuario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('requisicaofundo', function (Blueprint $table) {
            $table->dropForeign('FK_tfedl3oltb9o8eovef5efsc66');
            $table->dropForeign('FK_7a9d4b25td2bijvdrupoxcv2m');
            $table->dropForeign('FK_8vvou31981olxqv7d40psh6m2');
            $table->dropForeign('FK_sdwxlng1jw3w633jmrg2oa9ic');
            $table->dropForeign('FK_7jqsyys08pv6isl6b7yb9xre0');
            $table->dropForeign('FK_eolskwf9et44ahtpr0t2nbgad');
        });
    }
}
