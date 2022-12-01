<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToFacturaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('factura', function (Blueprint $table) {
            $table->foreign(['venda_vend_id'], 'FK_h7f67f4gdqlmkc705e397fy8a')->references(['vend_id'])->on('venda');
            $table->foreign(['conta_ctg_id'], 'FK_n9q1itic7w1m80i9fksj1f7ed')->references(['ctg_id'])->on('contageral');
            $table->foreign(['pagamento_pag_id'], 'FK_158uv0y880xxre18kwkayp4lp')->references(['pag_id'])->on('pagamento');
            $table->foreign(['usuario_usua_id'], 'FK_a70gyxw3dru3i5yrb6k17e9xq')->references(['usua_id'])->on('usuario');
            $table->foreign(['moeda_moe_id'], 'FK_f2ubmtdurx6mjqagc9ibcab8d')->references(['moe_id'])->on('moeda');
            $table->foreign(['Entidade_enti_id'], 'FK_l9cu83u86jv7swv2sayt2066h')->references(['enti_id'])->on('entidade');
            $table->foreign(['documento_doc_id'], 'FK_3hvhu0mt8vrm460rsarcjgn9d')->references(['doc_id'])->on('documento');
            $table->foreign(['caixa_caix_id'], 'FK_btj7lhcqrg4kcqtq1nn9x0d6w')->references(['caix_id'])->on('caixa');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('factura', function (Blueprint $table) {
            $table->dropForeign('FK_h7f67f4gdqlmkc705e397fy8a');
            $table->dropForeign('FK_n9q1itic7w1m80i9fksj1f7ed');
            $table->dropForeign('FK_158uv0y880xxre18kwkayp4lp');
            $table->dropForeign('FK_a70gyxw3dru3i5yrb6k17e9xq');
            $table->dropForeign('FK_f2ubmtdurx6mjqagc9ibcab8d');
            $table->dropForeign('FK_l9cu83u86jv7swv2sayt2066h');
            $table->dropForeign('FK_3hvhu0mt8vrm460rsarcjgn9d');
            $table->dropForeign('FK_btj7lhcqrg4kcqtq1nn9x0d6w');
        });
    }
}
