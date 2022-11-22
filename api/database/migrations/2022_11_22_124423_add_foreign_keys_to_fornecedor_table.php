<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToFornecedorTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('fornecedor', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_htg20ra8oqcm3h9gc5vr4uybj')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('fornecedor', function (Blueprint $table) {
            $table->dropForeign('FK_htg20ra8oqcm3h9gc5vr4uybj');
        });
    }
}
