<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToHorarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('horario', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_dw45ijcfdjf3ejgtagpfnun3q')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('horario', function (Blueprint $table) {
            $table->dropForeign('FK_dw45ijcfdjf3ejgtagpfnun3q');
        });
    }
}
