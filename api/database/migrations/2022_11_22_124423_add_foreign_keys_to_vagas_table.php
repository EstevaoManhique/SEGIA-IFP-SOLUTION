<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToVagasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('vagas', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_9la7tk47w1r4nd1gwd9kh7fd6')->references(['enti_id'])->on('entidade');
            $table->foreign(['curso_curs_id'], 'FK_imyyp6nj14hwetb2ug3fqf714')->references(['curs_id'])->on('curso');
            $table->foreign(['anoLectivo_anol_id'], 'FK_bvb17gjdvwvbvoeidoj2lxb5x')->references(['anol_id'])->on('anolectivo');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('vagas', function (Blueprint $table) {
            $table->dropForeign('FK_9la7tk47w1r4nd1gwd9kh7fd6');
            $table->dropForeign('FK_imyyp6nj14hwetb2ug3fqf714');
            $table->dropForeign('FK_bvb17gjdvwvbvoeidoj2lxb5x');
        });
    }
}
