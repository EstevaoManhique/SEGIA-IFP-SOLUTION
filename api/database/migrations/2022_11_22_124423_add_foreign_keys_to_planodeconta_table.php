<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToPlanodecontaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('planodeconta', function (Blueprint $table) {
            $table->foreign(['planoDeConta_pdc_id'], 'FK_jkqiofgh5a5sp15sf2h4fkwix')->references(['pdc_id'])->on('planodeconta');
            $table->foreign(['entidade_enti_id'], 'FK_m0js5l1tb10ewts4u63mh0qre')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('planodeconta', function (Blueprint $table) {
            $table->dropForeign('FK_jkqiofgh5a5sp15sf2h4fkwix');
            $table->dropForeign('FK_m0js5l1tb10ewts4u63mh0qre');
        });
    }
}
