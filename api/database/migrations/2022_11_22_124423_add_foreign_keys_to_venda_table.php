<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToVendaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('venda', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_4d1gvvw6bq6yprwe5y6b2b2ws')->references(['enti_id'])->on('entidade');
            $table->foreign(['cliente_clie_id'], 'FK_ixrflhygeck3m49e55lrm4j3b')->references(['clie_id'])->on('cliente');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('venda', function (Blueprint $table) {
            $table->dropForeign('FK_4d1gvvw6bq6yprwe5y6b2b2ws');
            $table->dropForeign('FK_ixrflhygeck3m49e55lrm4j3b');
        });
    }
}
