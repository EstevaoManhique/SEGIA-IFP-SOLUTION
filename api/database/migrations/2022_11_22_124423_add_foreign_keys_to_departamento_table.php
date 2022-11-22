<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToDepartamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('departamento', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_a756kbm4bsk6qrt6xhapj7l30')->references(['enti_id'])->on('entidade');
            $table->foreign(['nivelPrioridade_nvp_id'], 'FK_ntecai3lm5d1sa3ayu7ti3yo6')->references(['nvp_id'])->on('nivelprioridade');
            $table->foreign(['administracao_adm_id'], 'FK_eejspavkwhwuak1pq2uu3nssi')->references(['adm_id'])->on('administracao');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('departamento', function (Blueprint $table) {
            $table->dropForeign('FK_a756kbm4bsk6qrt6xhapj7l30');
            $table->dropForeign('FK_ntecai3lm5d1sa3ayu7ti3yo6');
            $table->dropForeign('FK_eejspavkwhwuak1pq2uu3nssi');
        });
    }
}
