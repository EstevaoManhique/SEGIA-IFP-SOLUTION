<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Sala
 * 
 * @property int $sala_id
 * @property bool $encrypted
 * @property Carbon|null $sala_data
 * @property string|null $sala_descricao
 * @property int|null $entidade_enti_id
 * @property int|null $escola_esc_id
 * 
 * @property Escola|null $escola
 * @property Entidade|null $entidade
 * @property Collection|Convocatorium[] $convocatoria
 * @property Collection|Salaexame[] $salaexames
 * @property Collection|Turma[] $turmas
 *
 * @package App\Models
 */
class Sala extends Model
{
	protected $table = 'sala';
	protected $primaryKey = 'sala_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int',
		'escola_esc_id' => 'int'
	];

	protected $dates = [
		'sala_data'
	];

	protected $fillable = [
		'encrypted',
		'sala_data',
		'sala_descricao',
		'entidade_enti_id',
		'escola_esc_id'
	];

	public function escola()
	{
		return $this->belongsTo(Escola::class, 'escola_esc_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function convocatoria()
	{
		return $this->hasMany(Convocatorium::class, 'sala_sala_id');
	}

	public function salaexames()
	{
		return $this->hasMany(Salaexame::class, 'sala_sala_id');
	}

	public function turmas()
	{
		return $this->hasMany(Turma::class, 'sala_sala_id');
	}
}
