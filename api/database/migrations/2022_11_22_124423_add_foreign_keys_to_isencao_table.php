<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToIsencaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('isencao', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_mcx522b08kyjqksylpusbuu01')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('isencao', function (Blueprint $table) {
            $table->dropForeign('FK_mcx522b08kyjqksylpusbuu01');
        });
    }
}
