<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Recibo
 * 
 * @property int $rec_id
 * @property bool $encrypted
 * @property Carbon|null $rec_data
 * @property int $rec_lancamento
 * @property float $rec_mullta
 * @property string|null $rec_observacoes
 * @property string|null $rec_recebemosDe
 * @property string|null $rec_referencia
 * @property float $rec_total
 * @property float $rec_valor
 * @property string|null $ref_bancoPagamento
 * @property string|null $ref_nrDocumentoPagamento
 * @property int|null $entidade_enti_id
 * @property int|null $factura_fact_id
 * @property int|null $pessoa_pess_id
 * 
 * @property Entidade|null $entidade
 * @property Pessoa|null $pessoa
 * @property Factura|null $factura
 *
 * @package App\Models
 */
class Recibo extends Model
{
	protected $table = 'recibo';
	protected $primaryKey = 'rec_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'rec_lancamento' => 'int',
		'rec_mullta' => 'float',
		'rec_total' => 'float',
		'rec_valor' => 'float',
		'entidade_enti_id' => 'int',
		'factura_fact_id' => 'int',
		'pessoa_pess_id' => 'int'
	];

	protected $dates = [
		'rec_data'
	];

	protected $fillable = [
		'encrypted',
		'rec_data',
		'rec_lancamento',
		'rec_mullta',
		'rec_observacoes',
		'rec_recebemosDe',
		'rec_referencia',
		'rec_total',
		'rec_valor',
		'ref_bancoPagamento',
		'ref_nrDocumentoPagamento',
		'entidade_enti_id',
		'factura_fact_id',
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

	public function factura()
	{
		return $this->belongsTo(Factura::class, 'factura_fact_id');
	}
}
