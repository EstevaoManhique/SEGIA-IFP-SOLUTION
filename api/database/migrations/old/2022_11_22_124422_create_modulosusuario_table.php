<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateModulosusuarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('modulosusuario', function (Blueprint $table) {
            $table->integer('mui_id', true);
            $table->boolean('encrypted');
            $table->boolean('mui_activos');
            $table->boolean('mui_aprovacaoDespesas');
            $table->boolean('mui_armazem');
            $table->boolean('mui_avaliacao');
            $table->boolean('mui_avaliacao_boletins');
            $table->boolean('mui_avaliacao_notas');
            $table->boolean('mui_avaliacao_observacoes');
            $table->boolean('mui_avaliacao_pautas');
            $table->boolean('mui_avaliacao_presencas');
            $table->boolean('mui_bancos');
            $table->boolean('mui_biblioteca');
            $table->boolean('mui_calendario');
            $table->boolean('mui_calendario_exames');
            $table->boolean('mui_calendario_horario');
            $table->boolean('mui_calendario_recorrencias');
            $table->boolean('mui_calendario_testes');
            $table->boolean('mui_clientes');
            $table->boolean('mui_comercial');
            $table->boolean('mui_configuracao');
            $table->boolean('mui_contratos');
            $table->boolean('mui_cursos');
            $table->boolean('mui_cursos_areasInscricao');
            $table->boolean('mui_cursos_cursos');
            $table->boolean('mui_cursos_cursosCentro');
            $table->boolean('mui_cursos_modulos');
            $table->boolean('mui_depositos');
            $table->boolean('mui_despesas');
            $table->boolean('mui_despesas_estoque');
            $table->boolean('mui_despesas_extracto');
            $table->boolean('mui_despesas_formacao');
            $table->boolean('mui_despesas_internas');
            $table->boolean('mui_disciplinas');
            $table->boolean('mui_disciplinas_curso');
            $table->boolean('mui_disciplinas_docente');
            $table->boolean('mui_disciplinas_gestao');
            $table->boolean('mui_disciplinas_turma');
            $table->boolean('mui_docuemntos');
            $table->boolean('mui_empresas');
            $table->boolean('mui_estatisticas');
            $table->boolean('mui_estatisticas_curso');
            $table->boolean('mui_estatisticas_gerais');
            $table->boolean('mui_facturas');
            $table->boolean('mui_financeiro');
            $table->boolean('mui_formasPagamento');
            $table->boolean('mui_fornecedores');
            $table->boolean('mui_gestao');
            $table->boolean('mui_gestao_centros');
            $table->boolean('mui_gestao_formadores');
            $table->boolean('mui_gestao_formados');
            $table->boolean('mui_gestao_inscricoes');
            $table->boolean('mui_gestao_parceiros');
            $table->boolean('mui_gestao_turmas');
            $table->boolean('mui_guiasRemessa');
            $table->boolean('mui_lancamentos');
            $table->boolean('mui_lembres');
            $table->boolean('mui_moedas');
            $table->boolean('mui_pagamentos');
            $table->boolean('mui_pagamentos_multas');
            $table->boolean('mui_pagamentos_outrosPagamentos');
            $table->boolean('mui_pagamentos_pagamentosOnline');
            $table->boolean('mui_pagamentos_propinas');
            $table->boolean('mui_pagamentos_situacaoPagamentos');
            $table->boolean('mui_pagamentos_taxas');
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
            $table->boolean('mui_usuarios_add');
            $table->boolean('mui_usuarios_logs');
            $table->boolean('mui_usuarios_permissoes');
            $table->boolean('mui_usuarios_status');
            $table->boolean('mui_vendas');
            $table->integer('entidade_enti_id')->nullable()->index('FK_lpxi2bq9hq5esqwyk3y8vr7vh');
            $table->integer('usuario_usua_id')->nullable()->index('FK_5nnpix6in7o42ph0bxrxofc18');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('modulosusuario');
    }
}
