<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToPresencasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('presencas', function (Blueprint $table) {
            $table->foreign(['aluno_alun_id'], 'FK_1s86gw2gw3q1m1mob9nmndn4t')->references(['alun_id'])->on('aluno');
            $table->foreign(['turma_turm_id'], 'FK_o16ns9ve81vtu7xcxhuj6cmqx')->references(['turm_id'])->on('turma');
            $table->foreign(['disciplina_disc_id'], 'FK_jrbwgptv6250nuxyvpvl4wfra')->references(['disc_id'])->on('disciplina');
            $table->foreign(['entidade_enti_id'], 'FK_sdk292n9vboqcl0yhmt6kuwf3')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('presencas', function (Blueprint $table) {
            $table->dropForeign('FK_1s86gw2gw3q1m1mob9nmndn4t');
            $table->dropForeign('FK_o16ns9ve81vtu7xcxhuj6cmqx');
            $table->dropForeign('FK_jrbwgptv6250nuxyvpvl4wfra');
            $table->dropForeign('FK_sdk292n9vboqcl0yhmt6kuwf3');
        });
    }
}
