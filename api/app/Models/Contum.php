<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Contum
 * 
 * @property int $con_id
 * @property int $con_codigo
 * @property string|null $con_nome
 * @property float $con_saldo
 * @property bool $encrypted
 * @property int|null $cliente_clie_id
 * @property int|null $entidade_enti_id
 * @property int|null $tipoConta_tip_id
 * 
 * @property Tipocontum|null $tipocontum
 * @property Cliente|null $cliente
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Contum extends Model
{
	protected $table = 'conta';
	protected $primaryKey = 'con_id';
	public $timestamps = false;

	protected $casts = [
		'con_codigo' => 'int',
		'con_saldo' => 'float',
		'encrypted' => 'bool',
		'cliente_clie_id' => 'int',
		'entidade_enti_id' => 'int',
		'tipoConta_tip_id' => 'int'
	];

	protected $fillable = [
		'con_codigo',
		'con_nome',
		'con_saldo',
		'encrypted',
		'cliente_clie_id',
		'entidade_enti_id',
		'tipoConta_tip_id'
	];

	public function tipocontum()
	{
		return $this->belongsTo(Tipocontum::class, 'tipoConta_tip_id');
	}

	public function cliente()
	{
		return $this->belongsTo(Cliente::class, 'cliente_clie_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
