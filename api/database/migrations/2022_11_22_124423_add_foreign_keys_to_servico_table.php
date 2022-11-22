<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToServicoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('servico', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_4achjjr0xbks5n9k1wbkbrued')->references(['enti_id'])->on('entidade');
            $table->foreign(['horariohora_hora_id'], 'FK_axqvf43v4v6i1mbm6aphcm851')->references(['hora_id'])->on('horario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('servico', function (Blueprint $table) {
            $table->dropForeign('FK_4achjjr0xbks5n9k1wbkbrued');
            $table->dropForeign('FK_axqvf43v4v6i1mbm6aphcm851');
        });
    }
}
