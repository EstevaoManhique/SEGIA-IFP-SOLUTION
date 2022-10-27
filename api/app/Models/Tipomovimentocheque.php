<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Tipomovimentocheque
 * 
 * @property int $tmc_id
 * @property bool $encrypted
 * @property string|null $tmc_descricao
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Requisicaocheque[] $requisicaocheques
 *
 * @package App\Models
 */
class Tipomovimentocheque extends Model
{
	protected $table = 'tipomovimentocheque';
	protected $primaryKey = 'tmc_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'tmc_descricao',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function requisicaocheques()
	{
		return $this->hasMany(Requisicaocheque::class, 'tipoMovimentoCheque_tmc_id');
	}
}
