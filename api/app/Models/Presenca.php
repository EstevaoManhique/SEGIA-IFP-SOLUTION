<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Presenca
 * 
 * @property int $pres_id
 * @property bool $encrypted
 * @property Carbon|null $pres_data
 * @property int $pres_faltas
 * @property int|null $aluno_alun_id
 * @property int|null $disciplina_disc_id
 * @property int|null $entidade_enti_id
 * @property int|null $turma_turm_id
 * 
 * @property Aluno|null $aluno
 * @property Disciplina|null $disciplina
 * @property Turma|null $turma
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Presenca extends Model
{
	protected $table = 'presencas';
	protected $primaryKey = 'pres_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'pres_faltas' => 'int',
		'aluno_alun_id' => 'int',
		'disciplina_disc_id' => 'int',
		'entidade_enti_id' => 'int',
		'turma_turm_id' => 'int'
	];

	protected $dates = [
		'pres_data'
	];

	protected $fillable = [
		'encrypted',
		'pres_data',
		'pres_faltas',
		'aluno_alun_id',
		'disciplina_disc_id',
		'entidade_enti_id',
		'turma_turm_id'
	];

	public function aluno()
	{
		return $this->belongsTo(Aluno::class, 'aluno_alun_id');
	}

	public function disciplina()
	{
		return $this->belongsTo(Disciplina::class, 'disciplina_disc_id');
	}

	public function turma()
	{
		return $this->belongsTo(Turma::class, 'turma_turm_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
