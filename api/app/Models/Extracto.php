<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Extracto
 * 
 * @property int $ext_id
 * @property bool $encrypted
 * @property float $ext_credito
 * @property Carbon|null $ext_data
 * @property float $ext_debito
 * @property string|null $ext_movimento
 * @property float $ext_saldo
 * @property int|null $entidade_enti_id
 * @property int|null $factura_fact_id
 * 
 * @property Factura|null $factura
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Extracto extends Model
{
	protected $table = 'extracto';
	protected $primaryKey = 'ext_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'ext_credito' => 'float',
		'ext_debito' => 'float',
		'ext_saldo' => 'float',
		'entidade_enti_id' => 'int',
		'factura_fact_id' => 'int'
	];

	protected $dates = [
		'ext_data'
	];

	protected $fillable = [
		'encrypted',
		'ext_credito',
		'ext_data',
		'ext_debito',
		'ext_movimento',
		'ext_saldo',
		'entidade_enti_id',
		'factura_fact_id'
	];

	public function factura()
	{
		return $this->belongsTo(Factura::class, 'factura_fact_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
