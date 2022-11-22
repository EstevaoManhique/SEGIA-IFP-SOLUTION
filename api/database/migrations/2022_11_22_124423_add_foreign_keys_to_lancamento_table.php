<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToLancamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('lancamento', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_oyykrytdsxa69dw06x1dpus9t')->references(['enti_id'])->on('entidade');
            $table->foreign(['contaPlano_ctg_id'], 'FK_slrnvtmw8hgql7iie4yhwar21')->references(['ctg_id'])->on('contageral');
            $table->foreign(['diario_dir_id'], 'FK_2swohlsdgt8vf5eykgnxgdl3e')->references(['dir_id'])->on('diario');
            $table->foreign(['funcionario_func_id'], 'FK_67f5hhyr6l5mdaer2m1j6qdmv')->references(['func_id'])->on('funcionario');
            $table->foreign(['contaCliente_ctg_id'], 'FK_mprqyx6w9rr06o84bodlm3406')->references(['ctg_id'])->on('contageral');
            $table->foreign(['usuario_usua_id'], 'FK_r4j1v194l8i4ysuagvryxpjlp')->references(['usua_id'])->on('usuario');
            $table->foreign(['factura_fact_id'], 'FK_4q6hf7htlr5elu5u89juqux52')->references(['fact_id'])->on('factura');
            $table->foreign(['documento_doc_id'], 'FK_7oolibak82pjyp9pnd0o9crvx')->references(['doc_id'])->on('documento');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('lancamento', function (Blueprint $table) {
            $table->dropForeign('FK_oyykrytdsxa69dw06x1dpus9t');
            $table->dropForeign('FK_slrnvtmw8hgql7iie4yhwar21');
            $table->dropForeign('FK_2swohlsdgt8vf5eykgnxgdl3e');
            $table->dropForeign('FK_67f5hhyr6l5mdaer2m1j6qdmv');
            $table->dropForeign('FK_mprqyx6w9rr06o84bodlm3406');
            $table->dropForeign('FK_r4j1v194l8i4ysuagvryxpjlp');
            $table->dropForeign('FK_4q6hf7htlr5elu5u89juqux52');
            $table->dropForeign('FK_7oolibak82pjyp9pnd0o9crvx');
        });
    }
}
