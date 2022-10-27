<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Referencium
 * 
 * @property int $ref_id
 * @property int $ref_adenda
 * @property string|null $ref_ano
 * @property int $ref_banco
 * @property int $ref_bordos
 * @property int $ref_budget
 * @property int $ref_cliente
 * @property int $ref_compras
 * @property int $ref_contrato
 * @property int $ref_curso
 * @property int $ref_deposito
 * @property int $ref_despesa
 * @property int $ref_diario
 * @property int $ref_disciplina
 * @property int $ref_docente
 * @property int $ref_documento
 * @property string|null $ref_entidade
 * @property int $ref_estudante
 * @property int $ref_estudanteAprovacoes
 * @property int $ref_estudanteDispensas
 * @property int $ref_estudanteExclusoes
 * @property int $ref_estudanteReprovacoes
 * @property int $ref_extractoCliente
 * @property int $ref_extractoStockArtigo
 * @property int $ref_extractoStockGeral
 * @property int $ref_factura
 * @property int $ref_facturaProForma
 * @property int $ref_faltas
 * @property int $ref_faltasJustificadas
 * @property int $ref_fecho
 * @property int $ref_fornecedor
 * @property int $ref_funcionario
 * @property int $ref_guia
 * @property int $ref_guiaAbate
 * @property int $ref_guiaEntrada
 * @property int $ref_guiaRemessa
 * @property int $ref_inscricoes
 * @property int $ref_lancamento
 * @property int $ref_lembrete
 * @property int $ref_movimento
 * @property int $ref_notaCredito
 * @property int $ref_notaDebito
 * @property int $ref_pagamento
 * @property int $ref_pagamentos
 * @property int $ref_pety
 * @property int $ref_petycash
 * @property int $ref_processamento
 * @property int $ref_recibo
 * @property int $ref_reciboPagamento
 * @property int $ref_requisicao
 * @property int $ref_requisicaoCheque
 * @property int $ref_salario
 * @property int $ref_turma
 * @property int $ref_vendaDinheiro
 * @property int $ref_vendas
 *
 * @package App\Models
 */
class Referencium extends Model
{
	protected $table = 'referencia';
	protected $primaryKey = 'ref_id';
	public $timestamps = false;

	protected $casts = [
		'ref_adenda' => 'int',
		'ref_banco' => 'int',
		'ref_bordos' => 'int',
		'ref_budget' => 'int',
		'ref_cliente' => 'int',
		'ref_compras' => 'int',
		'ref_contrato' => 'int',
		'ref_curso' => 'int',
		'ref_deposito' => 'int',
		'ref_despesa' => 'int',
		'ref_diario' => 'int',
		'ref_disciplina' => 'int',
		'ref_docente' => 'int',
		'ref_documento' => 'int',
		'ref_estudante' => 'int',
		'ref_estudanteAprovacoes' => 'int',
		'ref_estudanteDispensas' => 'int',
		'ref_estudanteExclusoes' => 'int',
		'ref_estudanteReprovacoes' => 'int',
		'ref_extractoCliente' => 'int',
		'ref_extractoStockArtigo' => 'int',
		'ref_extractoStockGeral' => 'int',
		'ref_factura' => 'int',
		'ref_facturaProForma' => 'int',
		'ref_faltas' => 'int',
		'ref_faltasJustificadas' => 'int',
		'ref_fecho' => 'int',
		'ref_fornecedor' => 'int',
		'ref_funcionario' => 'int',
		'ref_guia' => 'int',
		'ref_guiaAbate' => 'int',
		'ref_guiaEntrada' => 'int',
		'ref_guiaRemessa' => 'int',
		'ref_inscricoes' => 'int',
		'ref_lancamento' => 'int',
		'ref_lembrete' => 'int',
		'ref_movimento' => 'int',
		'ref_notaCredito' => 'int',
		'ref_notaDebito' => 'int',
		'ref_pagamento' => 'int',
		'ref_pagamentos' => 'int',
		'ref_pety' => 'int',
		'ref_petycash' => 'int',
		'ref_processamento' => 'int',
		'ref_recibo' => 'int',
		'ref_reciboPagamento' => 'int',
		'ref_requisicao' => 'int',
		'ref_requisicaoCheque' => 'int',
		'ref_salario' => 'int',
		'ref_turma' => 'int',
		'ref_vendaDinheiro' => 'int',
		'ref_vendas' => 'int'
	];

	protected $fillable = [
		'ref_adenda',
		'ref_ano',
		'ref_banco',
		'ref_bordos',
		'ref_budget',
		'ref_cliente',
		'ref_compras',
		'ref_contrato',
		'ref_curso',
		'ref_deposito',
		'ref_despesa',
		'ref_diario',
		'ref_disciplina',
		'ref_docente',
		'ref_documento',
		'ref_entidade',
		'ref_estudante',
		'ref_estudanteAprovacoes',
		'ref_estudanteDispensas',
		'ref_estudanteExclusoes',
		'ref_estudanteReprovacoes',
		'ref_extractoCliente',
		'ref_extractoStockArtigo',
		'ref_extractoStockGeral',
		'ref_factura',
		'ref_facturaProForma',
		'ref_faltas',
		'ref_faltasJustificadas',
		'ref_fecho',
		'ref_fornecedor',
		'ref_funcionario',
		'ref_guia',
		'ref_guiaAbate',
		'ref_guiaEntrada',
		'ref_guiaRemessa',
		'ref_inscricoes',
		'ref_lancamento',
		'ref_lembrete',
		'ref_movimento',
		'ref_notaCredito',
		'ref_notaDebito',
		'ref_pagamento',
		'ref_pagamentos',
		'ref_pety',
		'ref_petycash',
		'ref_processamento',
		'ref_recibo',
		'ref_reciboPagamento',
		'ref_requisicao',
		'ref_requisicaoCheque',
		'ref_salario',
		'ref_turma',
		'ref_vendaDinheiro',
		'ref_vendas'
	];
}
