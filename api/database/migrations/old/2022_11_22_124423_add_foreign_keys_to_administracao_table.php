<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAdministracaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('administracao', function (Blueprint $table) {
            $table->foreign(['empresa_enti_id'], 'FK_aew1eoj0u4en2ssyeipyc74g0')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('administracao', function (Blueprint $table) {
            $table->dropForeign('FK_aew1eoj0u4en2ssyeipyc74g0');
        });
    }
}
