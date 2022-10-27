<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Moeda
 * 
 * @property int $moe_id
 * @property bool $encrypted
 * @property float|null $moe_cambio
 * @property string|null $moe_nome
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Factura[] $facturas
 *
 * @package App\Models
 */
class Moeda extends Model
{
	protected $table = 'moeda';
	protected $primaryKey = 'moe_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'moe_cambio' => 'float',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'moe_cambio',
		'moe_nome',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function facturas()
	{
		return $this->hasMany(Factura::class, 'moeda_moe_id');
	}
}
