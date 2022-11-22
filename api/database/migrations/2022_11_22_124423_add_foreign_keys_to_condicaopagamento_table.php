<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToCondicaopagamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('condicaopagamento', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_jd8q8vknvxr8bglmvepxv6j6d')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('condicaopagamento', function (Blueprint $table) {
            $table->dropForeign('FK_jd8q8vknvxr8bglmvepxv6j6d');
        });
    }
}
