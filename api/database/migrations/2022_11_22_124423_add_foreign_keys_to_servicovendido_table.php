<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToServicovendidoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('servicovendido', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_eij7ug2pvmknod4fnfas1x2wd')->references(['enti_id'])->on('entidade');
            $table->foreign(['servico_serv_id'], 'FK_syb43bc82t8yjtpkjlb2d0lsw')->references(['serv_id'])->on('servico');
            $table->foreign(['factura_fact_id'], 'FK_oq1uxe1boyqak2jmaulagu563')->references(['fact_id'])->on('factura');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('servicovendido', function (Blueprint $table) {
            $table->dropForeign('FK_eij7ug2pvmknod4fnfas1x2wd');
            $table->dropForeign('FK_syb43bc82t8yjtpkjlb2d0lsw');
            $table->dropForeign('FK_oq1uxe1boyqak2jmaulagu563');
        });
    }
}
