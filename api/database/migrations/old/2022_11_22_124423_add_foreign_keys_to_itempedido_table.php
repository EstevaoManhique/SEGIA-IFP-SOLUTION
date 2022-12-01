<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToItempedidoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('itempedido', function (Blueprint $table) {
            $table->foreign(['guiaRemessa_guia_id'], 'FK_5gafq0bq1ce9j0mlo6436y6hk')->references(['guia_id'])->on('guiaremessa');
            $table->foreign(['entidade_enti_id'], 'FK_m6m2s7nhn25qfgodw35mi4ksr')->references(['enti_id'])->on('entidade');
            $table->foreign(['factura_fact_id'], 'FK_gcnldac310v1ro23xsngeq89')->references(['fact_id'])->on('factura');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('itempedido', function (Blueprint $table) {
            $table->dropForeign('FK_5gafq0bq1ce9j0mlo6436y6hk');
            $table->dropForeign('FK_m6m2s7nhn25qfgodw35mi4ksr');
            $table->dropForeign('FK_gcnldac310v1ro23xsngeq89');
        });
    }
}
