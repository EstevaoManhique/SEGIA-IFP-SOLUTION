<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Extractocontageral
 * 
 * @property int $extc_id
 * @property bool $encrypted
 * @property float $extc_credito
 * @property Carbon|null $extc_data
 * @property float $extc_debito
 * @property string|null $extc_movimento
 * @property string|null $extc_referencia
 * @property int|null $contaGeral_ctg_id
 * @property int|null $entidade_enti_id
 * @property int|null $lancamento_lan_id
 * 
 * @property Contageral|null $contageral
 * @property Lancamento|null $lancamento
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Extractocontageral extends Model
{
	protected $table = 'extractocontageral';
	protected $primaryKey = 'extc_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'extc_credito' => 'float',
		'extc_debito' => 'float',
		'contaGeral_ctg_id' => 'int',
		'entidade_enti_id' => 'int',
		'lancamento_lan_id' => 'int'
	];

	protected $dates = [
		'extc_data'
	];

	protected $fillable = [
		'encrypted',
		'extc_credito',
		'extc_data',
		'extc_debito',
		'extc_movimento',
		'extc_referencia',
		'contaGeral_ctg_id',
		'entidade_enti_id',
		'lancamento_lan_id'
	];

	public function contageral()
	{
		return $this->belongsTo(Contageral::class, 'contaGeral_ctg_id');
	}

	public function lancamento()
	{
		return $this->belongsTo(Lancamento::class, 'lancamento_lan_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
