<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Calendarioexame
 * 
 * @property int $calee_id
 * @property Carbon|null $calee_exame
 * @property Carbon|null $calee_exameLimite
 * @property Carbon|null $calee_recorrencia
 * @property Carbon|null $calee_recorrenciaLimite
 * @property string|null $calee_semestre
 * @property bool $encrypted
 * @property int|null $anoLectivo_anol_id
 * @property int|null $curso_curs_id
 * @property int|null $disciplina_disc_id
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Anolectivo|null $anolectivo
 * @property Curso|null $curso
 * @property Disciplina|null $disciplina
 *
 * @package App\Models
 */
class Calendarioexame extends Model
{
	protected $table = 'calendarioexame';
	protected $primaryKey = 'calee_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'anoLectivo_anol_id' => 'int',
		'curso_curs_id' => 'int',
		'disciplina_disc_id' => 'int',
		'entidade_enti_id' => 'int'
	];

	protected $dates = [
		'calee_exame',
		'calee_exameLimite',
		'calee_recorrencia',
		'calee_recorrenciaLimite'
	];

	protected $fillable = [
		'calee_exame',
		'calee_exameLimite',
		'calee_recorrencia',
		'calee_recorrenciaLimite',
		'calee_semestre',
		'encrypted',
		'anoLectivo_anol_id',
		'curso_curs_id',
		'disciplina_disc_id',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function anolectivo()
	{
		return $this->belongsTo(Anolectivo::class, 'anoLectivo_anol_id');
	}

	public function curso()
	{
		return $this->belongsTo(Curso::class, 'curso_curs_id');
	}

	public function disciplina()
	{
		return $this->belongsTo(Disciplina::class, 'disciplina_disc_id');
	}
}
