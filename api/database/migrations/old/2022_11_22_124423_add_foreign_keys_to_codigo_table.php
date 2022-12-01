<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToCodigoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('codigo', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_9jcxm9npbsq43k8s73ovjdb48')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('codigo', function (Blueprint $table) {
            $table->dropForeign('FK_9jcxm9npbsq43k8s73ovjdb48');
        });
    }
}
