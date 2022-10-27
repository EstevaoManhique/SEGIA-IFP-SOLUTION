<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Recibopagamento
 * 
 * @property int $recp_id
 * @property bool $encrypted
 * @property Carbon|null $recp_data
 * @property int $recp_lancamento
 * @property float $recp_multa
 * @property string|null $recp_observacoes
 * @property string|null $recp_recebemosDe
 * @property string|null $recp_referencia
 * @property float $recp_total
 * @property float $recp_valor
 * @property string|null $ref_bancoPagamento
 * @property string|null $ref_nrDocumentoPagamento
 * @property int|null $entidade_enti_id
 * @property int|null $pessoa_pess_id
 * 
 * @property Entidade|null $entidade
 * @property Pessoa|null $pessoa
 * @property Collection|Pagamento[] $pagamentos
 *
 * @package App\Models
 */
class Recibopagamento extends Model
{
	protected $table = 'recibopagamento';
	protected $primaryKey = 'recp_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'recp_lancamento' => 'int',
		'recp_multa' => 'float',
		'recp_total' => 'float',
		'recp_valor' => 'float',
		'entidade_enti_id' => 'int',
		'pessoa_pess_id' => 'int'
	];

	protected $dates = [
		'recp_data'
	];

	protected $fillable = [
		'encrypted',
		'recp_data',
		'recp_lancamento',
		'recp_multa',
		'recp_observacoes',
		'recp_recebemosDe',
		'recp_referencia',
		'recp_total',
		'recp_valor',
		'ref_bancoPagamento',
		'ref_nrDocumentoPagamento',
		'entidade_enti_id',
		'pessoa_pess_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function pessoa()
	{
		return $this->belongsTo(Pessoa::class, 'pessoa_pess_id');
	}

	public function pagamentos()
	{
		return $this->hasMany(Pagamento::class, 'reciboPagamento_recp_id');
	}
}
