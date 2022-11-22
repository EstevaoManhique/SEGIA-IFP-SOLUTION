<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToRequisicaomaterialTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('requisicaomaterial', function (Blueprint $table) {
            $table->foreign(['pessoa_pess_id'], 'FK_8quo3tfx7cfk17w30t3rmg1m1')->references(['pess_id'])->on('pessoa');
            $table->foreign(['entidade_enti_id'], 'FK_hliqklmlo1051ejs8cn1tmvx5')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('requisicaomaterial', function (Blueprint $table) {
            $table->dropForeign('FK_8quo3tfx7cfk17w30t3rmg1m1');
            $table->dropForeign('FK_hliqklmlo1051ejs8cn1tmvx5');
        });
    }
}
