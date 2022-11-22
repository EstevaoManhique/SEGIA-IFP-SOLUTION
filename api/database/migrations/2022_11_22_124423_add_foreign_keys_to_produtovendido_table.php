<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToProdutovendidoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('produtovendido', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_1qfvgbf47f67lm1qe141li2w')->references(['enti_id'])->on('entidade');
            $table->foreign(['factura_fact_id'], 'FK_fd71ro974t7t11hmtn5tmcf6r')->references(['fact_id'])->on('factura');
            $table->foreign(['produto_pro_id'], 'FK_bvo0424p1lwo9u8ri6oxcykry')->references(['pro_id'])->on('produto');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('produtovendido', function (Blueprint $table) {
            $table->dropForeign('FK_1qfvgbf47f67lm1qe141li2w');
            $table->dropForeign('FK_fd71ro974t7t11hmtn5tmcf6r');
            $table->dropForeign('FK_bvo0424p1lwo9u8ri6oxcykry');
        });
    }
}
