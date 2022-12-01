<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToPdfTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('pdf', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_dixllrvenrnav3xhbvxafw4k7')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('pdf', function (Blueprint $table) {
            $table->dropForeign('FK_dixllrvenrnav3xhbvxafw4k7');
        });
    }
}
