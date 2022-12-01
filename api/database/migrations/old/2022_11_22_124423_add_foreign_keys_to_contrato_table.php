<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToContratoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('contrato', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_ai16kqg1fsg5a9lx2hjtm132u')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('contrato', function (Blueprint $table) {
            $table->dropForeign('FK_ai16kqg1fsg5a9lx2hjtm132u');
        });
    }
}
