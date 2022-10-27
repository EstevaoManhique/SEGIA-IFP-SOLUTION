<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Tema
 * 
 * @property int $tema_id
 * @property bool $encrypted
 * @property string|null $tema_descricao
 * @property int $tema_pratica
 * @property int $tema_teorica
 * @property int|null $curso_curs_id
 * @property int|null $disciplina_disc_id
 * @property int|null $entidade_enti_id
 * @property int|null $escola_esc_id
 * 
 * @property Disciplina|null $disciplina
 * @property Escola|null $escola
 * @property Curso|null $curso
 * @property Entidade|null $entidade
 * @property Collection|Sumario[] $sumarios
 *
 * @package App\Models
 */
class Tema extends Model
{
	protected $table = 'tema';
	protected $primaryKey = 'tema_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'tema_pratica' => 'int',
		'tema_teorica' => 'int',
		'curso_curs_id' => 'int',
		'disciplina_disc_id' => 'int',
		'entidade_enti_id' => 'int',
		'escola_esc_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'tema_descricao',
		'tema_pratica',
		'tema_teorica',
		'curso_curs_id',
		'disciplina_disc_id',
		'entidade_enti_id',
		'escola_esc_id'
	];

	public function disciplina()
	{
		return $this->belongsTo(Disciplina::class, 'disciplina_disc_id');
	}

	public function escola()
	{
		return $this->belongsTo(Escola::class, 'escola_esc_id');
	}

	public function curso()
	{
		return $this->belongsTo(Curso::class, 'curso_curs_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function sumarios()
	{
		return $this->hasMany(Sumario::class, 'tema_tema_id');
	}
}
