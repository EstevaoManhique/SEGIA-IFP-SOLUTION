<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToExtractoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('extracto', function (Blueprint $table) {
            $table->foreign(['factura_fact_id'], 'FK_a4mmrye6vdk99babdgo11611r')->references(['fact_id'])->on('factura');
            $table->foreign(['entidade_enti_id'], 'FK_ccf1yuw773xr9tltok1h48hf')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('extracto', function (Blueprint $table) {
            $table->dropForeign('FK_a4mmrye6vdk99babdgo11611r');
            $table->dropForeign('FK_ccf1yuw773xr9tltok1h48hf');
        });
    }
}
