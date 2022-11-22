<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToBrowserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('browser', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_nf9r0bemspgneg8ixbm91f98r')->references(['usua_id'])->on('usuario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('browser', function (Blueprint $table) {
            $table->dropForeign('FK_nf9r0bemspgneg8ixbm91f98r');
        });
    }
}
