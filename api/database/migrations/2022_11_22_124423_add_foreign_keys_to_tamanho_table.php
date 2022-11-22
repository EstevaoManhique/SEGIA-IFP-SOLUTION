<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToTamanhoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tamanho', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_408o2i3odp2h524j7iteb3cw6')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tamanho', function (Blueprint $table) {
            $table->dropForeign('FK_408o2i3odp2h524j7iteb3cw6');
        });
    }
}
