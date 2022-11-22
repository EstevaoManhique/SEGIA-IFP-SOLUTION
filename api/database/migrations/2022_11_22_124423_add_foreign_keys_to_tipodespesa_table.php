<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToTipodespesaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tipodespesa', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_n8cv7fhwx682504n7e84s1abm')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tipodespesa', function (Blueprint $table) {
            $table->dropForeign('FK_n8cv7fhwx682504n7e84s1abm');
        });
    }
}
