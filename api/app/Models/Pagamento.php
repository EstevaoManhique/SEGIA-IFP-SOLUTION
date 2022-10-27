<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Pagamento
 * 
 * @property int $pag_id
 * @property bool $encrypted
 * @property bool $online
 * @property bool $pag_actual
 * @property string|null $pag_categorizacao
 * @property float $pag_comissao
 * @property string|null $pag_condicao
 * @property Carbon|null $pag_data
 * @property Carbon|null $pag_dataLimite
 * @property Carbon|null $pag_dataPagamento
 * @property string|null $pag_descricao
 * @property string|null $pag_estado
 * @property string|null $pag_formaPagamento
 * @property float $pag_multa
 * @property string|null $pag_origem
 * @property string|null $pag_periodo
 * @property string|null $pag_recibo
 * @property string|null $pag_refElectronico
 * @property string|null $pag_refOnline
 * @property string|null $pag_referencia
 * @property bool $pag_status
 * @property float $pag_valor
 * @property float $pag_valorPago
 * @property int|null $caixa_caix_id
 * @property int|null $entidade_enti_id
 * @property int|null $inscricao_insc_id
 * @property int|null $pessoa_pess_id
 * @property int|null $reciboPagamento_recp_id
 * @property int|null $turma_turm_id
 * 
 * @property Inscricao|null $inscricao
 * @property Turma|null $turma
 * @property Caixa|null $caixa
 * @property Entidade|null $entidade
 * @property Recibopagamento|null $recibopagamento
 * @property Pessoa|null $pessoa
 * @property Collection|Factura[] $facturas
 *
 * @package App\Models
 */
class Pagamento extends Model
{
	protected $table = 'pagamento';
	protected $primaryKey = 'pag_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'online' => 'bool',
		'pag_actual' => 'bool',
		'pag_comissao' => 'float',
		'pag_multa' => 'float',
		'pag_status' => 'bool',
		'pag_valor' => 'float',
		'pag_valorPago' => 'float',
		'caixa_caix_id' => 'int',
		'entidade_enti_id' => 'int',
		'inscricao_insc_id' => 'int',
		'pessoa_pess_id' => 'int',
		'reciboPagamento_recp_id' => 'int',
		'turma_turm_id' => 'int'
	];

	protected $dates = [
		'pag_data',
		'pag_dataLimite',
		'pag_dataPagamento'
	];

	protected $fillable = [
		'encrypted',
		'online',
		'pag_actual',
		'pag_categorizacao',
		'pag_comissao',
		'pag_condicao',
		'pag_data',
		'pag_dataLimite',
		'pag_dataPagamento',
		'pag_descricao',
		'pag_estado',
		'pag_formaPagamento',
		'pag_multa',
		'pag_origem',
		'pag_periodo',
		'pag_recibo',
		'pag_refElectronico',
		'pag_refOnline',
		'pag_referencia',
		'pag_status',
		'pag_valor',
		'pag_valorPago',
		'caixa_caix_id',
		'entidade_enti_id',
		'inscricao_insc_id',
		'pessoa_pess_id',
		'reciboPagamento_recp_id',
		'turma_turm_id'
	];

	public function inscricao()
	{
		return $this->belongsTo(Inscricao::class, 'inscricao_insc_id');
	}

	public function turma()
	{
		return $this->belongsTo(Turma::class, 'turma_turm_id');
	}

	public function caixa()
	{
		return $this->belongsTo(Caixa::class, 'caixa_caix_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function recibopagamento()
	{
		return $this->belongsTo(Recibopagamento::class, 'reciboPagamento_recp_id');
	}

	public function pessoa()
	{
		return $this->belongsTo(Pessoa::class, 'pessoa_pess_id');
	}

	public function facturas()
	{
		return $this->hasMany(Factura::class, 'pagamento_pag_id');
	}
}
