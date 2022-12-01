<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToFormularioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('formulario', function (Blueprint $table) {
            $table->foreign(['sistema_sist_id'], 'FK_oax4s6ao8ok58c0a14xdkh5ll')->references(['sist_id'])->on('sistema');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('formulario', function (Blueprint $table) {
            $table->dropForeign('FK_oax4s6ao8ok58c0a14xdkh5ll');
        });
    }
}
