<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToRegistofechoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('registofecho', function (Blueprint $table) {
            $table->foreign(['fecho_fech_id'], 'FK_f060lgbl3b9vy1jxd4i75mfe0')->references(['fech_id'])->on('fecho');
            $table->foreign(['entidade_enti_id'], 'FK_gc4430dvlvhhefsyik11qrmvs')->references(['enti_id'])->on('entidade');
            $table->foreign(['produto_pro_id'], 'FK_fgmxjvb8v0ba0ck8akdt7bj90')->references(['pro_id'])->on('produto');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('registofecho', function (Blueprint $table) {
            $table->dropForeign('FK_f060lgbl3b9vy1jxd4i75mfe0');
            $table->dropForeign('FK_gc4430dvlvhhefsyik11qrmvs');
            $table->dropForeign('FK_fgmxjvb8v0ba0ck8akdt7bj90');
        });
    }
}
