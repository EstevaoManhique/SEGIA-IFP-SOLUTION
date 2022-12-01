<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToUploadTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('upload', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_td1bqjvx66r3n02u7e5p8w957')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('upload', function (Blueprint $table) {
            $table->dropForeign('FK_td1bqjvx66r3n02u7e5p8w957');
        });
    }
}
