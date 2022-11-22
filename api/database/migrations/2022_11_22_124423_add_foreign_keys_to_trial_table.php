<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToTrialTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('trial', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_2pi6vfkw2ux50mxrqpqotsc1f')->references(['enti_id'])->on('entidade');
            $table->foreign(['sistema_sist_id'], 'FK_6o75t58ve3g3lmc53y8uo2arl')->references(['sist_id'])->on('sistema');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('trial', function (Blueprint $table) {
            $table->dropForeign('FK_2pi6vfkw2ux50mxrqpqotsc1f');
            $table->dropForeign('FK_6o75t58ve3g3lmc53y8uo2arl');
        });
    }
}
