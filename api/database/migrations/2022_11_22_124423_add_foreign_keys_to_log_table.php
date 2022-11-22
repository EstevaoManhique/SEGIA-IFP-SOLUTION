<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToLogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('log', function (Blueprint $table) {
            $table->foreign(['sistema_sist_id'], 'FK_17hwvurguvvlewxi4utq6fe59')->references(['sist_id'])->on('sistema');
            $table->foreign(['usuario_usua_id'], 'FK_hrw7vv9m5xq0synxuq10kmfay')->references(['usua_id'])->on('usuario');
            $table->foreign(['entidade_enti_id'], 'FK_53yj8pgaidsaeif40iu3ltj7k')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('log', function (Blueprint $table) {
            $table->dropForeign('FK_17hwvurguvvlewxi4utq6fe59');
            $table->dropForeign('FK_hrw7vv9m5xq0synxuq10kmfay');
            $table->dropForeign('FK_53yj8pgaidsaeif40iu3ltj7k');
        });
    }
}
