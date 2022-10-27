<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Turno
 * 
 * @property int $turn_id
 * @property bool $encrypted
 * @property string|null $turn_descricao
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Inscricao[] $inscricaos
 *
 * @package App\Models
 */
class Turno extends Model
{
	protected $table = 'turno';
	protected $primaryKey = 'turn_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'turn_descricao',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function inscricaos()
	{
		return $this->hasMany(Inscricao::class, 'turno_turn_id');
	}
}
