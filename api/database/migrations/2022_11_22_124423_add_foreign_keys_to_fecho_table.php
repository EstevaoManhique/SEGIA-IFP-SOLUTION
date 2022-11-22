<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToFechoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('fecho', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_a2pypwlps868k2h25ijd3x4c9')->references(['usua_id'])->on('usuario');
            $table->foreign(['entidade_enti_id'], 'FK_j2jny3mpptg4l9eb65ydhgrt7')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('fecho', function (Blueprint $table) {
            $table->dropForeign('FK_a2pypwlps868k2h25ijd3x4c9');
            $table->dropForeign('FK_j2jny3mpptg4l9eb65ydhgrt7');
        });
    }
}
