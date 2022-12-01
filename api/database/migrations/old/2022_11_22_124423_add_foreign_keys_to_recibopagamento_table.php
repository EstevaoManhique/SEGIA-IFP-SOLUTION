<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToRecibopagamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('recibopagamento', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_a5nlf4y0qhcurr6q4vn8ebfym')->references(['enti_id'])->on('entidade');
            $table->foreign(['pessoa_pess_id'], 'FK_a9twha88ftu3gf0x0966lj23x')->references(['pess_id'])->on('pessoa');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('recibopagamento', function (Blueprint $table) {
            $table->dropForeign('FK_a5nlf4y0qhcurr6q4vn8ebfym');
            $table->dropForeign('FK_a9twha88ftu3gf0x0966lj23x');
        });
    }
}
