<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Pety
 * 
 * @property int $pety_id
 * @property bool $encrypted
 * @property string|null $pety_periodo
 * @property float $pety_valorrestante
 * @property float $pety_valortotal
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Petycash[] $petycashes
 *
 * @package App\Models
 */
class Pety extends Model
{
	protected $table = 'pety';
	protected $primaryKey = 'pety_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'pety_valorrestante' => 'float',
		'pety_valortotal' => 'float',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'pety_periodo',
		'pety_valorrestante',
		'pety_valortotal',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function petycashes()
	{
		return $this->hasMany(Petycash::class, 'pety_pety_id');
	}
}
