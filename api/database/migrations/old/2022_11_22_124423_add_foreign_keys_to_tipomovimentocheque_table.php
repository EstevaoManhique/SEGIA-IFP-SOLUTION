<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToTipomovimentochequeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tipomovimentocheque', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_ffn2ll5h290u1vo473qdxk1r8')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tipomovimentocheque', function (Blueprint $table) {
            $table->dropForeign('FK_ffn2ll5h290u1vo473qdxk1r8');
        });
    }
}
