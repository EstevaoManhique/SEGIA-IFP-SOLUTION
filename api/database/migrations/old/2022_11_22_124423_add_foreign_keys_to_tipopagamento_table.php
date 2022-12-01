<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToTipopagamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tipopagamento', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_8hq7mqd70c8y7irqiyp4corde')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tipopagamento', function (Blueprint $table) {
            $table->dropForeign('FK_8hq7mqd70c8y7irqiyp4corde');
        });
    }
}
