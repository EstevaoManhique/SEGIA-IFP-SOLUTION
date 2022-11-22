<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToSalaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('sala', function (Blueprint $table) {
            $table->foreign(['escola_esc_id'], 'FK_oufefojirb3860t33r740oybr')->references(['esc_id'])->on('escola');
            $table->foreign(['entidade_enti_id'], 'FK_rc1qvyjvnfrjmk8p4ah0x0xmg')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('sala', function (Blueprint $table) {
            $table->dropForeign('FK_oufefojirb3860t33r740oybr');
            $table->dropForeign('FK_rc1qvyjvnfrjmk8p4ah0x0xmg');
        });
    }
}
