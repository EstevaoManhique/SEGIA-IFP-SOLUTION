<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToParceiroTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('parceiro', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_8xcy30fnj5f3aivlrebj77chw')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('parceiro', function (Blueprint $table) {
            $table->dropForeign('FK_8xcy30fnj5f3aivlrebj77chw');
        });
    }
}
