<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToConvocatoriaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('convocatoria', function (Blueprint $table) {
            $table->foreign(['escola_esc_id'], 'FK_apoof1bkue143pkqin5kwwx4y')->references(['esc_id'])->on('escola');
            $table->foreign(['entidade_enti_id'], 'FK_gkdc0jlmd4xm2xgp62eivb0rb')->references(['enti_id'])->on('entidade');
            $table->foreign(['secretario_pess_id'], 'FK_t3hiysasu59vo0q8dkbxwqtji')->references(['pess_id'])->on('pessoa');
            $table->foreign(['presidente_pess_id'], 'FK_e0xt4d8ncvmnwlychpy9ly9tw')->references(['pess_id'])->on('pessoa');
            $table->foreign(['sala_sala_id'], 'FK_hh963dw5wk8duqwvdx0r5h0t0')->references(['sala_id'])->on('sala');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('convocatoria', function (Blueprint $table) {
            $table->dropForeign('FK_apoof1bkue143pkqin5kwwx4y');
            $table->dropForeign('FK_gkdc0jlmd4xm2xgp62eivb0rb');
            $table->dropForeign('FK_t3hiysasu59vo0q8dkbxwqtji');
            $table->dropForeign('FK_e0xt4d8ncvmnwlychpy9ly9tw');
            $table->dropForeign('FK_hh963dw5wk8duqwvdx0r5h0t0');
        });
    }
}
