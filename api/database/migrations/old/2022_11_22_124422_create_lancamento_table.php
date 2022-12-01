<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLancamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lancamento', function (Blueprint $table) {
            $table->integer('lan_id', true);
            $table->boolean('encrypted');
            $table->date('lan_data')->nullable();
            $table->longText('lan_descricao')->nullable();
            $table->double('lan_iva');
            $table->bigInteger('lan_numero');
            $table->string('lan_operacao')->nullable();
            $table->string('lan_referencia')->nullable();
            $table->string('lan_referenciaDiario')->nullable();
            $table->string('lan_referenciaDocumento')->nullable();
            $table->string('lan_referenciaMovimento')->nullable();
            $table->double('lan_valor');
            $table->integer('contaCliente_ctg_id')->nullable()->index('FK_mprqyx6w9rr06o84bodlm3406');
            $table->integer('contaPlano_ctg_id')->nullable()->index('FK_slrnvtmw8hgql7iie4yhwar21');
            $table->integer('diario_dir_id')->nullable()->index('FK_2swohlsdgt8vf5eykgnxgdl3e');
            $table->integer('documento_doc_id')->nullable()->index('FK_7oolibak82pjyp9pnd0o9crvx');
            $table->integer('entidade_enti_id')->nullable()->index('FK_oyykrytdsxa69dw06x1dpus9t');
            $table->integer('factura_fact_id')->nullable()->index('FK_4q6hf7htlr5elu5u89juqux52');
            $table->integer('funcionario_func_id')->nullable()->index('FK_67f5hhyr6l5mdaer2m1j6qdmv');
            $table->integer('usuario_usua_id')->nullable()->index('FK_r4j1v194l8i4ysuagvryxpjlp');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('lancamento');
    }
}
