<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToNivelacessoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('nivelacesso', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_5rlfyqoopm3uj1020x77t1c8q')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('nivelacesso', function (Blueprint $table) {
            $table->dropForeign('FK_5rlfyqoopm3uj1020x77t1c8q');
        });
    }
}
