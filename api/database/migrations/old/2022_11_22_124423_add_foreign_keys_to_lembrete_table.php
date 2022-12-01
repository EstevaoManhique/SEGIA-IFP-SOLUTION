<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToLembreteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('lembrete', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_3qtx9c5ectk7q1la7jb0vmb8d')->references(['enti_id'])->on('entidade');
            $table->foreign(['usuario_usua_id'], 'FK_83e03e4682r7v5nyfl0il6kpc')->references(['usua_id'])->on('usuario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('lembrete', function (Blueprint $table) {
            $table->dropForeign('FK_3qtx9c5ectk7q1la7jb0vmb8d');
            $table->dropForeign('FK_83e03e4682r7v5nyfl0il6kpc');
        });
    }
}
