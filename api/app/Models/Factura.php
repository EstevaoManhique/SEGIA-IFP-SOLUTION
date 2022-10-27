<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Factura
 * 
 * @property int $fact_id
 * @property bool $encrypted
 * @property float $fact_ValorTrocos
 * @property string|null $fact_bancoPagamento
 * @property float $fact_cambio
 * @property string|null $fact_categorizacao
 * @property string|null $fact_condicaoPagamento
 * @property Carbon|null $fact_data
 * @property Carbon|null $fact_dataLimite
 * @property Carbon|null $fact_dataPagamento
 * @property float $fact_desconto
 * @property float $fact_descontoFinaceiro
 * @property string|null $fact_documentoPagamento
 * @property string|null $fact_documentoReferencia
 * @property bool $fact_emitida
 * @property bool $fact_emitidoRecibo
 * @property string|null $fact_item
 * @property bool $fact_iva
 * @property bool $fact_lancada
 * @property string|null $fact_motivoIsencao
 * @property string|null $fact_nrDocumentoPagamento
 * @property int $fact_numerocartao
 * @property int $fact_numerolancamento
 * @property string|null $fact_observacoes
 * @property string|null $fact_origem
 * @property int $fact_pedidoCliente
 * @property int $fact_prestacoes
 * @property int $fact_prestacoesPagas
 * @property bool $fact_reciboProcessado
 * @property string|null $fact_referencia
 * @property string|null $fact_referenciaRecibo
 * @property string|null $fact_requisicao
 * @property string|null $fact_status
 * @property string|null $fact_tipo
 * @property float $fact_valorIncidencia
 * @property float $fact_valorMulta
 * @property float $fact_valorPago
 * @property float $fact_valorProcessado
 * @property float $fact_valorRecibo
 * @property float $fact_valorTotalMedio
 * @property float $fact_valoriva
 * @property float $fact_valortotal
 * @property int|null $Entidade_enti_id
 * @property int|null $caixa_caix_id
 * @property int|null $conta_ctg_id
 * @property int|null $documento_doc_id
 * @property int|null $moeda_moe_id
 * @property int|null $pagamento_pag_id
 * @property int|null $usuario_usua_id
 * @property int|null $venda_vend_id
 * 
 * @property Pagamento|null $pagamento
 * @property Documento|null $documento
 * @property Usuario|null $usuario
 * @property Caixa|null $caixa
 * @property Moeda|null $moeda
 * @property Venda|null $venda
 * @property Entidade|null $entidade
 * @property Contageral|null $contageral
 * @property Collection|Extracto[] $extractos
 * @property Collection|Fluxo[] $fluxos
 * @property Collection|Guiaremessa[] $guiaremessas
 * @property Collection|Itempedido[] $itempedidos
 * @property Collection|Lancamento[] $lancamentos
 * @property Collection|Produtovendido[] $produtovendidos
 * @property Collection|Recibo[] $recibos
 * @property Collection|Servicovendido[] $servicovendidos
 *
 * @package App\Models
 */
class Factura extends Model
{
	protected $table = 'factura';
	protected $primaryKey = 'fact_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'fact_ValorTrocos' => 'float',
		'fact_cambio' => 'float',
		'fact_desconto' => 'float',
		'fact_descontoFinaceiro' => 'float',
		'fact_emitida' => 'bool',
		'fact_emitidoRecibo' => 'bool',
		'fact_iva' => 'bool',
		'fact_lancada' => 'bool',
		'fact_numerocartao' => 'int',
		'fact_numerolancamento' => 'int',
		'fact_pedidoCliente' => 'int',
		'fact_prestacoes' => 'int',
		'fact_prestacoesPagas' => 'int',
		'fact_reciboProcessado' => 'bool',
		'fact_valorIncidencia' => 'float',
		'fact_valorMulta' => 'float',
		'fact_valorPago' => 'float',
		'fact_valorProcessado' => 'float',
		'fact_valorRecibo' => 'float',
		'fact_valorTotalMedio' => 'float',
		'fact_valoriva' => 'float',
		'fact_valortotal' => 'float',
		'Entidade_enti_id' => 'int',
		'caixa_caix_id' => 'int',
		'conta_ctg_id' => 'int',
		'documento_doc_id' => 'int',
		'moeda_moe_id' => 'int',
		'pagamento_pag_id' => 'int',
		'usuario_usua_id' => 'int',
		'venda_vend_id' => 'int'
	];

	protected $dates = [
		'fact_data',
		'fact_dataLimite',
		'fact_dataPagamento'
	];

	protected $fillable = [
		'encrypted',
		'fact_ValorTrocos',
		'fact_bancoPagamento',
		'fact_cambio',
		'fact_categorizacao',
		'fact_condicaoPagamento',
		'fact_data',
		'fact_dataLimite',
		'fact_dataPagamento',
		'fact_desconto',
		'fact_descontoFinaceiro',
		'fact_documentoPagamento',
		'fact_documentoReferencia',
		'fact_emitida',
		'fact_emitidoRecibo',
		'fact_item',
		'fact_iva',
		'fact_lancada',
		'fact_motivoIsencao',
		'fact_nrDocumentoPagamento',
		'fact_numerocartao',
		'fact_numerolancamento',
		'fact_observacoes',
		'fact_origem',
		'fact_pedidoCliente',
		'fact_prestacoes',
		'fact_prestacoesPagas',
		'fact_reciboProcessado',
		'fact_referencia',
		'fact_referenciaRecibo',
		'fact_requisicao',
		'fact_status',
		'fact_tipo',
		'fact_valorIncidencia',
		'fact_valorMulta',
		'fact_valorPago',
		'fact_valorProcessado',
		'fact_valorRecibo',
		'fact_valorTotalMedio',
		'fact_valoriva',
		'fact_valortotal',
		'Entidade_enti_id',
		'caixa_caix_id',
		'conta_ctg_id',
		'documento_doc_id',
		'moeda_moe_id',
		'pagamento_pag_id',
		'usuario_usua_id',
		'venda_vend_id'
	];

	public function pagamento()
	{
		return $this->belongsTo(Pagamento::class, 'pagamento_pag_id');
	}

	public function documento()
	{
		return $this->belongsTo(Documento::class, 'documento_doc_id');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function caixa()
	{
		return $this->belongsTo(Caixa::class, 'caixa_caix_id');
	}

	public function moeda()
	{
		return $this->belongsTo(Moeda::class, 'moeda_moe_id');
	}

	public function venda()
	{
		return $this->belongsTo(Venda::class, 'venda_vend_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function contageral()
	{
		return $this->belongsTo(Contageral::class, 'conta_ctg_id');
	}

	public function extractos()
	{
		return $this->hasMany(Extracto::class, 'factura_fact_id');
	}

	public function fluxos()
	{
		return $this->hasMany(Fluxo::class, 'factura_fact_id');
	}

	public function guiaremessas()
	{
		return $this->hasMany(Guiaremessa::class, 'factura_fact_id');
	}

	public function itempedidos()
	{
		return $this->hasMany(Itempedido::class, 'factura_fact_id');
	}

	public function lancamentos()
	{
		return $this->hasMany(Lancamento::class, 'factura_fact_id');
	}

	public function produtovendidos()
	{
		return $this->hasMany(Produtovendido::class, 'factura_fact_id');
	}

	public function recibos()
	{
		return $this->hasMany(Recibo::class, 'factura_fact_id');
	}

	public function servicovendidos()
	{
		return $this->hasMany(Servicovendido::class, 'factura_fact_id');
	}
}
