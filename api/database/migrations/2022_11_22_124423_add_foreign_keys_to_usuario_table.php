<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToUsuarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('usuario', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_5a5bibnjilke4mr7nkrmjticp')->references(['enti_id'])->on('entidade');
            $table->foreign(['escola_esc_id'], 'FK_7w82doj5vwuciq058t64vhhnc')->references(['esc_id'])->on('escola');
            $table->foreign(['pessoapess_pess_id'], 'FK_68hgfkgf5x972ri2g7r4qsobw')->references(['pess_id'])->on('pessoa');
            $table->foreign(['tipoUsuariotipu_tipu_id'], 'FK_edswmmi93y1eqnhfl9n4ecl4h')->references(['tipu_id'])->on('tipousuario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('usuario', function (Blueprint $table) {
            $table->dropForeign('FK_5a5bibnjilke4mr7nkrmjticp');
            $table->dropForeign('FK_7w82doj5vwuciq058t64vhhnc');
            $table->dropForeign('FK_68hgfkgf5x972ri2g7r4qsobw');
            $table->dropForeign('FK_edswmmi93y1eqnhfl9n4ecl4h');
        });
    }
}
