<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToFirmaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('firma', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_d5jmo64oggci0jrax2wwci3qx')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('firma', function (Blueprint $table) {
            $table->dropForeign('FK_d5jmo64oggci0jrax2wwci3qx');
        });
    }
}
