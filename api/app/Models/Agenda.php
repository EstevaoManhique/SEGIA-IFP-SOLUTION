<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Agenda
 * 
 * @property int $agen_id
 * @property string|null $agen_diaSemana
 * @property string|null $agen_hora
 * @property string|null $agen_semestre
 * @property bool $encrypted
 * @property int|null $anoLectivo_anol_id
 * @property int|null $disciplina_disc_id
 * @property int|null $entidade_enti_id
 * @property int|null $turma_turm_id
 * 
 * @property Turma|null $turma
 * @property Anolectivo|null $anolectivo
 * @property Entidade|null $entidade
 * @property Disciplina|null $disciplina
 *
 * @package App\Models
 */
class Agenda extends Model
{
	protected $table = 'agenda';
	protected $primaryKey = 'agen_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'anoLectivo_anol_id' => 'int',
		'disciplina_disc_id' => 'int',
		'entidade_enti_id' => 'int',
		'turma_turm_id' => 'int'
	];

	protected $fillable = [
		'agen_diaSemana',
		'agen_hora',
		'agen_semestre',
		'encrypted',
		'anoLectivo_anol_id',
		'disciplina_disc_id',
		'entidade_enti_id',
		'turma_turm_id'
	];

	public function turma()
	{
		return $this->belongsTo(Turma::class, 'turma_turm_id');
	}

	public function anolectivo()
	{
		return $this->belongsTo(Anolectivo::class, 'anoLectivo_anol_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function disciplina()
	{
		return $this->belongsTo(Disciplina::class, 'disciplina_disc_id');
	}
}
