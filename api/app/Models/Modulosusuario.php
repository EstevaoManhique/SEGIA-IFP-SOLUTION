<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Modulosusuario
 * 
 * @property int $mui_id
 * @property bool $encrypted
 * @property bool $mui_activos
 * @property bool $mui_aprovacaoDespesas
 * @property bool $mui_armazem
 * @property bool $mui_avaliacao
 * @property bool $mui_avaliacao_boletins
 * @property bool $mui_avaliacao_notas
 * @property bool $mui_avaliacao_observacoes
 * @property bool $mui_avaliacao_pautas
 * @property bool $mui_avaliacao_presencas
 * @property bool $mui_bancos
 * @property bool $mui_biblioteca
 * @property bool $mui_calendario
 * @property bool $mui_calendario_exames
 * @property bool $mui_calendario_horario
 * @property bool $mui_calendario_recorrencias
 * @property bool $mui_calendario_testes
 * @property bool $mui_clientes
 * @property bool $mui_comercial
 * @property bool $mui_configuracao
 * @property bool $mui_contratos
 * @property bool $mui_cursos
 * @property bool $mui_cursos_areasInscricao
 * @property bool $mui_cursos_cursos
 * @property bool $mui_cursos_cursosCentro
 * @property bool $mui_cursos_modulos
 * @property bool $mui_depositos
 * @property bool $mui_despesas
 * @property bool $mui_despesas_estoque
 * @property bool $mui_despesas_extracto
 * @property bool $mui_despesas_formacao
 * @property bool $mui_despesas_internas
 * @property bool $mui_disciplinas
 * @property bool $mui_disciplinas_curso
 * @property bool $mui_disciplinas_docente
 * @property bool $mui_disciplinas_gestao
 * @property bool $mui_disciplinas_turma
 * @property bool $mui_docuemntos
 * @property bool $mui_empresas
 * @property bool $mui_estatisticas
 * @property bool $mui_estatisticas_curso
 * @property bool $mui_estatisticas_gerais
 * @property bool $mui_facturas
 * @property bool $mui_financeiro
 * @property bool $mui_formasPagamento
 * @property bool $mui_fornecedores
 * @property bool $mui_gestao
 * @property bool $mui_gestao_centros
 * @property bool $mui_gestao_formadores
 * @property bool $mui_gestao_formados
 * @property bool $mui_gestao_inscricoes
 * @property bool $mui_gestao_parceiros
 * @property bool $mui_gestao_turmas
 * @property bool $mui_guiasRemessa
 * @property bool $mui_lancamentos
 * @property bool $mui_lembres
 * @property bool $mui_moedas
 * @property bool $mui_pagamentos
 * @property bool $mui_pagamentos_multas
 * @property bool $mui_pagamentos_outrosPagamentos
 * @property bool $mui_pagamentos_pagamentosOnline
 * @property bool $mui_pagamentos_propinas
 * @property bool $mui_pagamentos_situacaoPagamentos
 * @property bool $mui_pagamentos_taxas
 * @property bool $mui_petyCash
 * @property bool $mui_planosDeConta
 * @property bool $mui_produtos
 * @property bool $mui_recursosHumanos
 * @property bool $mui_requisicoes
 * @property bool $mui_requisicoes_add
 * @property bool $mui_requisicoes_aprove
 * @property bool $mui_requisicoes_list
 * @property bool $mui_requisicoes_status
 * @property bool $mui_resultados
 * @property bool $mui_usuarios
 * @property bool $mui_usuarios_add
 * @property bool $mui_usuarios_logs
 * @property bool $mui_usuarios_permissoes
 * @property bool $mui_usuarios_status
 * @property bool $mui_vendas
 * @property int|null $entidade_enti_id
 * @property int|null $usuario_usua_id
 * 
 * @property Usuario|null $usuario
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Modulosusuario extends Model
{
	protected $table = 'modulosusuario';
	protected $primaryKey = 'mui_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'mui_activos' => 'bool',
		'mui_aprovacaoDespesas' => 'bool',
		'mui_armazem' => 'bool',
		'mui_avaliacao' => 'bool',
		'mui_avaliacao_boletins' => 'bool',
		'mui_avaliacao_notas' => 'bool',
		'mui_avaliacao_observacoes' => 'bool',
		'mui_avaliacao_pautas' => 'bool',
		'mui_avaliacao_presencas' => 'bool',
		'mui_bancos' => 'bool',
		'mui_biblioteca' => 'bool',
		'mui_calendario' => 'bool',
		'mui_calendario_exames' => 'bool',
		'mui_calendario_horario' => 'bool',
		'mui_calendario_recorrencias' => 'bool',
		'mui_calendario_testes' => 'bool',
		'mui_clientes' => 'bool',
		'mui_comercial' => 'bool',
		'mui_configuracao' => 'bool',
		'mui_contratos' => 'bool',
		'mui_cursos' => 'bool',
		'mui_cursos_areasInscricao' => 'bool',
		'mui_cursos_cursos' => 'bool',
		'mui_cursos_cursosCentro' => 'bool',
		'mui_cursos_modulos' => 'bool',
		'mui_depositos' => 'bool',
		'mui_despesas' => 'bool',
		'mui_despesas_estoque' => 'bool',
		'mui_despesas_extracto' => 'bool',
		'mui_despesas_formacao' => 'bool',
		'mui_despesas_internas' => 'bool',
		'mui_disciplinas' => 'bool',
		'mui_disciplinas_curso' => 'bool',
		'mui_disciplinas_docente' => 'bool',
		'mui_disciplinas_gestao' => 'bool',
		'mui_disciplinas_turma' => 'bool',
		'mui_docuemntos' => 'bool',
		'mui_empresas' => 'bool',
		'mui_estatisticas' => 'bool',
		'mui_estatisticas_curso' => 'bool',
		'mui_estatisticas_gerais' => 'bool',
		'mui_facturas' => 'bool',
		'mui_financeiro' => 'bool',
		'mui_formasPagamento' => 'bool',
		'mui_fornecedores' => 'bool',
		'mui_gestao' => 'bool',
		'mui_gestao_centros' => 'bool',
		'mui_gestao_formadores' => 'bool',
		'mui_gestao_formados' => 'bool',
		'mui_gestao_inscricoes' => 'bool',
		'mui_gestao_parceiros' => 'bool',
		'mui_gestao_turmas' => 'bool',
		'mui_guiasRemessa' => 'bool',
		'mui_lancamentos' => 'bool',
		'mui_lembres' => 'bool',
		'mui_moedas' => 'bool',
		'mui_pagamentos' => 'bool',
		'mui_pagamentos_multas' => 'bool',
		'mui_pagamentos_outrosPagamentos' => 'bool',
		'mui_pagamentos_pagamentosOnline' => 'bool',
		'mui_pagamentos_propinas' => 'bool',
		'mui_pagamentos_situacaoPagamentos' => 'bool',
		'mui_pagamentos_taxas' => 'bool',
		'mui_petyCash' => 'bool',
		'mui_planosDeConta' => 'bool',
		'mui_produtos' => 'bool',
		'mui_recursosHumanos' => 'bool',
		'mui_requisicoes' => 'bool',
		'mui_requisicoes_add' => 'bool',
		'mui_requisicoes_aprove' => 'bool',
		'mui_requisicoes_list' => 'bool',
		'mui_requisicoes_status' => 'bool',
		'mui_resultados' => 'bool',
		'mui_usuarios' => 'bool',
		'mui_usuarios_add' => 'bool',
		'mui_usuarios_logs' => 'bool',
		'mui_usuarios_permissoes' => 'bool',
		'mui_usuarios_status' => 'bool',
		'mui_vendas' => 'bool',
		'entidade_enti_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'mui_activos',
		'mui_aprovacaoDespesas',
		'mui_armazem',
		'mui_avaliacao',
		'mui_avaliacao_boletins',
		'mui_avaliacao_notas',
		'mui_avaliacao_observacoes',
		'mui_avaliacao_pautas',
		'mui_avaliacao_presencas',
		'mui_bancos',
		'mui_biblioteca',
		'mui_calendario',
		'mui_calendario_exames',
		'mui_calendario_horario',
		'mui_calendario_recorrencias',
		'mui_calendario_testes',
		'mui_clientes',
		'mui_comercial',
		'mui_configuracao',
		'mui_contratos',
		'mui_cursos',
		'mui_cursos_areasInscricao',
		'mui_cursos_cursos',
		'mui_cursos_cursosCentro',
		'mui_cursos_modulos',
		'mui_depositos',
		'mui_despesas',
		'mui_despesas_estoque',
		'mui_despesas_extracto',
		'mui_despesas_formacao',
		'mui_despesas_internas',
		'mui_disciplinas',
		'mui_disciplinas_curso',
		'mui_disciplinas_docente',
		'mui_disciplinas_gestao',
		'mui_disciplinas_turma',
		'mui_docuemntos',
		'mui_empresas',
		'mui_estatisticas',
		'mui_estatisticas_curso',
		'mui_estatisticas_gerais',
		'mui_facturas',
		'mui_financeiro',
		'mui_formasPagamento',
		'mui_fornecedores',
		'mui_gestao',
		'mui_gestao_centros',
		'mui_gestao_formadores',
		'mui_gestao_formados',
		'mui_gestao_inscricoes',
		'mui_gestao_parceiros',
		'mui_gestao_turmas',
		'mui_guiasRemessa',
		'mui_lancamentos',
		'mui_lembres',
		'mui_moedas',
		'mui_pagamentos',
		'mui_pagamentos_multas',
		'mui_pagamentos_outrosPagamentos',
		'mui_pagamentos_pagamentosOnline',
		'mui_pagamentos_propinas',
		'mui_pagamentos_situacaoPagamentos',
		'mui_pagamentos_taxas',
		'mui_petyCash',
		'mui_planosDeConta',
		'mui_produtos',
		'mui_recursosHumanos',
		'mui_requisicoes',
		'mui_requisicoes_add',
		'mui_requisicoes_aprove',
		'mui_requisicoes_list',
		'mui_requisicoes_status',
		'mui_resultados',
		'mui_usuarios',
		'mui_usuarios_add',
		'mui_usuarios_logs',
		'mui_usuarios_permissoes',
		'mui_usuarios_status',
		'mui_vendas',
		'entidade_enti_id',
		'usuario_usua_id'
	];

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
