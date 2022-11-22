<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToReciboTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('recibo', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_een6cvnfnmhsu7a1fr28gwdoh')->references(['enti_id'])->on('entidade');
            $table->foreign(['factura_fact_id'], 'FK_qwr1eh0n82isctf14l2udpkpf')->references(['fact_id'])->on('factura');
            $table->foreign(['pessoa_pess_id'], 'FK_mruycpcwb5friinmuxpf2bg4l')->references(['pess_id'])->on('pessoa');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('recibo', function (Blueprint $table) {
            $table->dropForeign('FK_een6cvnfnmhsu7a1fr28gwdoh');
            $table->dropForeign('FK_qwr1eh0n82isctf14l2udpkpf');
            $table->dropForeign('FK_mruycpcwb5friinmuxpf2bg4l');
        });
    }
}
