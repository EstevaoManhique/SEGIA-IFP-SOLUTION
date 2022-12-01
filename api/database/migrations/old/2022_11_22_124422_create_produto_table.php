<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProdutoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('produto', function (Blueprint $table) {
            $table->integer('pro_id', true);
            $table->boolean('encrypted');
            $table->string('pro_codigo')->nullable();
            $table->string('pro_codigo_barras')->nullable();
            $table->dateTime('pro_dataFabrico')->nullable();
            $table->dateTime('pro_dataValidade')->nullable();
            $table->string('pro_descriminacao')->nullable();
            $table->longText('pro_detalhes')->nullable();
            $table->integer('pro_estoque');
            $table->string('pro_imagem')->nullable();
            $table->string('pro_marca')->nullable();
            $table->integer('pro_margemAlarme');
            $table->longText('pro_nome')->nullable();
            $table->double('pro_preco');
            $table->double('pro_preco2');
            $table->double('pro_precoCompra');
            $table->string('pro_segmento')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_k8hoadduq8snpouaq9nhvo6uo');
            $table->integer('categoriaProduto_catp_id')->nullable()->index('FK_o41y7r98r75obaqbbdc2hjl9c');
            $table->integer('cor_cor_id')->nullable()->index('FK_idmkj9i4kwl7u1vsk7euocw26');
            $table->integer('fornecedor_for_id')->nullable()->index('FK_96q57to8p0qtfln1txppbodkj');
            $table->integer('tamanho_tam_id')->nullable()->index('FK_ksnpb5s9vhlw4qyet836xq14q');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('produto');
    }
}
