<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Servicovendido
 * 
 * @property int $srv_id
 * @property bool $encrypted
 * @property float $srv_desconto
 * @property int $srv_qtd
 * @property float $srv_total
 * @property int|null $entidade_enti_id
 * @property int|null $factura_fact_id
 * @property int|null $servico_serv_id
 * 
 * @property Entidade|null $entidade
 * @property Factura|null $factura
 * @property Servico|null $servico
 *
 * @package App\Models
 */
class Servicovendido extends Model
{
	protected $table = 'servicovendido';
	protected $primaryKey = 'srv_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'srv_desconto' => 'float',
		'srv_qtd' => 'int',
		'srv_total' => 'float',
		'entidade_enti_id' => 'int',
		'factura_fact_id' => 'int',
		'servico_serv_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'srv_desconto',
		'srv_qtd',
		'srv_total',
		'entidade_enti_id',
		'factura_fact_id',
		'servico_serv_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function factura()
	{
		return $this->belongsTo(Factura::class, 'factura_fact_id');
	}

	public function servico()
	{
		return $this->belongsTo(Servico::class, 'servico_serv_id');
	}
}
