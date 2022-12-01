<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToDocTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('doc', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_qr4ly0f28e1x76b7jjitigub2')->references(['usua_id'])->on('usuario');
            $table->foreign(['departamento_dep_id'], 'FK_4qtl42972kex8o60r6voski7k')->references(['dep_id'])->on('departamento');
            $table->foreign(['entidade_enti_id'], 'FK_dhlomryq5ayjbncd0miomx8dy')->references(['enti_id'])->on('entidade');
            $table->foreign(['usuario3_usua_id'], 'FK_lho08pgudxfeu30j095lhmu71')->references(['usua_id'])->on('usuario');
            $table->foreign(['codigo_cod_id'], 'FK_tjdx0op0bm45fprc5ay9jkyaa')->references(['cod_id'])->on('codigo');
            $table->foreign(['usuario2_usua_id'], 'FK_5o947e57pp40bdkpy1y3cdq08')->references(['usua_id'])->on('usuario');
            $table->foreign(['escola_esc_id'], 'FK_ldeks5i11tw7bqgs0m2v95lw0')->references(['esc_id'])->on('escola');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('doc', function (Blueprint $table) {
            $table->dropForeign('FK_qr4ly0f28e1x76b7jjitigub2');
            $table->dropForeign('FK_4qtl42972kex8o60r6voski7k');
            $table->dropForeign('FK_dhlomryq5ayjbncd0miomx8dy');
            $table->dropForeign('FK_lho08pgudxfeu30j095lhmu71');
            $table->dropForeign('FK_tjdx0op0bm45fprc5ay9jkyaa');
            $table->dropForeign('FK_5o947e57pp40bdkpy1y3cdq08');
            $table->dropForeign('FK_ldeks5i11tw7bqgs0m2v95lw0');
        });
    }
}
