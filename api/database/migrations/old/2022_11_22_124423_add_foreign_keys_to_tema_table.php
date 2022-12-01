<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToTemaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('tema', function (Blueprint $table) {
            $table->foreign(['disciplina_disc_id'], 'FK_433hyqi59ej4b18urfh55ibwc')->references(['disc_id'])->on('disciplina');
            $table->foreign(['curso_curs_id'], 'FK_q6awj9i9f0vena7vmnqvfa8q8')->references(['curs_id'])->on('curso');
            $table->foreign(['escola_esc_id'], 'FK_mwlxog9vafn3tnjspa8b2wqua')->references(['esc_id'])->on('escola');
            $table->foreign(['entidade_enti_id'], 'FK_wvu5tm95abblay70mpfsd0tw')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tema', function (Blueprint $table) {
            $table->dropForeign('FK_433hyqi59ej4b18urfh55ibwc');
            $table->dropForeign('FK_q6awj9i9f0vena7vmnqvfa8q8');
            $table->dropForeign('FK_mwlxog9vafn3tnjspa8b2wqua');
            $table->dropForeign('FK_wvu5tm95abblay70mpfsd0tw');
        });
    }
}
