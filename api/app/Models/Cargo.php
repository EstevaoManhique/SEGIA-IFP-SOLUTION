<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Cargo
 * 
 * @property int $car_id
 * @property string|null $car_nome
 * @property bool $encrypted
 * @property int|null $Entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Funcionario[] $funcionarios
 *
 * @package App\Models
 */
class Cargo extends Model
{
	protected $table = 'cargo';
	protected $primaryKey = 'car_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'car_nome',
		'encrypted',
		'Entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function funcionarios()
	{
		return $this->hasMany(Funcionario::class, 'cargo_car_id');
	}
}
