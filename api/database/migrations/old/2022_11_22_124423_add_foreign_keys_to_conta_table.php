<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToContaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('conta', function (Blueprint $table) {
            $table->foreign(['tipoConta_tip_id'], 'FK_asdv8b3rjfjtilsw5hftw7eoe')->references(['tip_id'])->on('tipoconta');
            $table->foreign(['entidade_enti_id'], 'FK_sjijacd720ikrpj8citoj25e5')->references(['enti_id'])->on('entidade');
            $table->foreign(['cliente_clie_id'], 'FK_nex8koc1uo9mlnrdfjcguwjw9')->references(['clie_id'])->on('cliente');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('conta', function (Blueprint $table) {
            $table->dropForeign('FK_asdv8b3rjfjtilsw5hftw7eoe');
            $table->dropForeign('FK_sjijacd720ikrpj8citoj25e5');
            $table->dropForeign('FK_nex8koc1uo9mlnrdfjcguwjw9');
        });
    }
}
