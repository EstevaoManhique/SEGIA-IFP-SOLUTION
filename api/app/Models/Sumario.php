<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Sumario
 * 
 * @property int $suma_id
 * @property bool $encrypted
 * @property string|null $suma_avaliacao
 * @property string|null $suma_bibliografia
 * @property Carbon|null $suma_data
 * @property string|null $suma_descricao
 * @property string|null $suma_metodologia
 * @property string|null $suma_objectivo
 * @property string|null $suma_recursos
 * @property string|null $suma_resumo
 * @property int|null $curso_curs_id
 * @property int|null $disciplina_disc_id
 * @property int|null $entidade_enti_id
 * @property int|null $escola_esc_id
 * @property int|null $tema_tema_id
 * 
 * @property Disciplina|null $disciplina
 * @property Escola|null $escola
 * @property Entidade|null $entidade
 * @property Tema|null $tema
 * @property Curso|null $curso
 *
 * @package App\Models
 */
class Sumario extends Model
{
	protected $table = 'sumario';
	protected $primaryKey = 'suma_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'curso_curs_id' => 'int',
		'disciplina_disc_id' => 'int',
		'entidade_enti_id' => 'int',
		'escola_esc_id' => 'int',
		'tema_tema_id' => 'int'
	];

	protected $dates = [
		'suma_data'
	];

	protected $fillable = [
		'encrypted',
		'suma_avaliacao',
		'suma_bibliografia',
		'suma_data',
		'suma_descricao',
		'suma_metodologia',
		'suma_objectivo',
		'suma_recursos',
		'suma_resumo',
		'curso_curs_id',
		'disciplina_disc_id',
		'entidade_enti_id',
		'escola_esc_id',
		'tema_tema_id'
	];

	public function disciplina()
	{
		return $this->belongsTo(Disciplina::class, 'disciplina_disc_id');
	}

	public function escola()
	{
		return $this->belongsTo(Escola::class, 'escola_esc_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function tema()
	{
		return $this->belongsTo(Tema::class, 'tema_tema_id');
	}

	public function curso()
	{
		return $this->belongsTo(Curso::class, 'curso_curs_id');
	}
}
