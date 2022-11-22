<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToProdutoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('produto', function (Blueprint $table) {
            $table->foreign(['fornecedor_for_id'], 'FK_96q57to8p0qtfln1txppbodkj')->references(['for_id'])->on('fornecedor');
            $table->foreign(['Entidade_enti_id'], 'FK_k8hoadduq8snpouaq9nhvo6uo')->references(['enti_id'])->on('entidade');
            $table->foreign(['categoriaProduto_catp_id'], 'FK_o41y7r98r75obaqbbdc2hjl9c')->references(['catp_id'])->on('categoriaproduto');
            $table->foreign(['cor_cor_id'], 'FK_idmkj9i4kwl7u1vsk7euocw26')->references(['cor_id'])->on('cor');
            $table->foreign(['tamanho_tam_id'], 'FK_ksnpb5s9vhlw4qyet836xq14q')->references(['tam_id'])->on('tamanho');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('produto', function (Blueprint $table) {
            $table->dropForeign('FK_96q57to8p0qtfln1txppbodkj');
            $table->dropForeign('FK_k8hoadduq8snpouaq9nhvo6uo');
            $table->dropForeign('FK_o41y7r98r75obaqbbdc2hjl9c');
            $table->dropForeign('FK_idmkj9i4kwl7u1vsk7euocw26');
            $table->dropForeign('FK_ksnpb5s9vhlw4qyet836xq14q');
        });
    }
}
