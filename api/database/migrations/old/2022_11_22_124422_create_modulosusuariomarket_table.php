<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateModulosusuariomarketTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('modulosusuariomarket', function (Blueprint $table) {
            $table->integer('mui_id', true);
            $table->boolean('encrypted');
            $table->boolean('mui_activos');
            $table->boolean('mui_bancos');
            $table->boolean('mui_clientes');
            $table->boolean('mui_depositos');
            $table->boolean('mui_despesas');
            $table->boolean('mui_empresas');
            $table->boolean('mui_estatisticas');
            $table->boolean('mui_facturas');
            $table->boolean('mui_formasPagamento');
            $table->boolean('mui_fornecedores');
            $table->boolean('mui_guiasRemessa');
            $table->boolean('mui_lancamentos');
            $table->boolean('mui_moedas');
            $table->boolean('mui_petyCash');
            $table->boolean('mui_planosDeConta');
            $table->boolean('mui_produtos');
            $table->boolean('mui_recursosHumanos');
            $table->boolean('mui_requisicoes');
            $table->boolean('mui_requisicoes_add');
            $table->boolean('mui_requisicoes_aprove');
            $table->boolean('mui_requisicoes_list');
            $table->boolean('mui_requisicoes_status');
            $table->boolean('mui_resultados');
            $table->boolean('mui_usuarios');
            $table->boolean('mui_vendas');
            $table->integer('entidade_enti_id')->nullable()->index('FK_ibpxaq5rn7mikbprq7ejgmxf7');
            $table->integer('usuario_usua_id')->nullable()->index('FK_fn5lc3asuu38xwaddm5b79cvo');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('modulosusuariomarket');
    }
}
