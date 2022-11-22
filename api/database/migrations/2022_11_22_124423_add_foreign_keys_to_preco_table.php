<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToPrecoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('preco', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_giqja0oe0jkxn2qto934lj3k7')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('preco', function (Blueprint $table) {
            $table->dropForeign('FK_giqja0oe0jkxn2qto934lj3k7');
        });
    }
}
