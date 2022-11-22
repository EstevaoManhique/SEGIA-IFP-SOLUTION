<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToActivoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('activo', function (Blueprint $table) {
            $table->foreign(['fornecedor_for_id'], 'FK_c7i9rp55yxtixj2ofssn83vne')->references(['for_id'])->on('fornecedor');
            $table->foreign(['entidade_enti_id'], 'FK_rp47hp38awi1fpqoc4ebmp5qp')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('activo', function (Blueprint $table) {
            $table->dropForeign('FK_c7i9rp55yxtixj2ofssn83vne');
            $table->dropForeign('FK_rp47hp38awi1fpqoc4ebmp5qp');
        });
    }
}
