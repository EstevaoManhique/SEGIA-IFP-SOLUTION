<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMovimentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('movimento', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_16gy57vr9j4vlabrkkaf5yonr')->references(['enti_id'])->on('entidade');
            $table->foreign(['banco_bnc_id'], 'FK_r01a5wotlfpfssovpw16olj6f')->references(['bnc_id'])->on('banco');
            $table->foreign(['usuario_usua_id'], 'FK_dm0ob0oesk0xfe2qmggquu371')->references(['usua_id'])->on('usuario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('movimento', function (Blueprint $table) {
            $table->dropForeign('FK_16gy57vr9j4vlabrkkaf5yonr');
            $table->dropForeign('FK_r01a5wotlfpfssovpw16olj6f');
            $table->dropForeign('FK_dm0ob0oesk0xfe2qmggquu371');
        });
    }
}
