<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMeiopagamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('meiopagamento', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_8lf5vr0g0jmtxi28w4q3sotj8')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('meiopagamento', function (Blueprint $table) {
            $table->dropForeign('FK_8lf5vr0g0jmtxi28w4q3sotj8');
        });
    }
}
