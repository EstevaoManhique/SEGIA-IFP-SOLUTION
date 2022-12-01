<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToTiposervicoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tiposervico', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_es4rf2ptocmkdl7ug04x7qwn9')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tiposervico', function (Blueprint $table) {
            $table->dropForeign('FK_es4rf2ptocmkdl7ug04x7qwn9');
        });
    }
}
