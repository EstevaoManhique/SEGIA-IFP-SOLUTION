<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Salaexame
 * 
 * @property int $salae_id
 * @property Carbon|null $salae_data
 * @property int $salae_maxAlunos
 * @property int $salae_ocupado
 * @property int|null $anoLectivo_anol_id
 * @property int|null $curso_curs_id
 * @property int|null $disciplina_disc_id
 * @property int|null $entidade_enti_id
 * @property int|null $juri1_doce_id
 * @property int|null $juri2_doce_id
 * @property int|null $sala_sala_id
 * 
 * @property Anolectivo|null $anolectivo
 * @property Docente|null $docente
 * @property Entidade|null $entidade
 * @property Sala|null $sala
 * @property Curso|null $curso
 * @property Disciplina|null $disciplina
 * @property Collection|Exame[] $exames
 *
 * @package App\Models
 */
class Salaexame extends Model
{
	protected $table = 'salaexame';
	protected $primaryKey = 'salae_id';
	public $timestamps = false;

	protected $casts = [
		'salae_maxAlunos' => 'int',
		'salae_ocupado' => 'int',
		'anoLectivo_anol_id' => 'int',
		'curso_curs_id' => 'int',
		'disciplina_disc_id' => 'int',
		'entidade_enti_id' => 'int',
		'juri1_doce_id' => 'int',
		'juri2_doce_id' => 'int',
		'sala_sala_id' => 'int'
	];

	protected $dates = [
		'salae_data'
	];

	protected $fillable = [
		'salae_data',
		'salae_maxAlunos',
		'salae_ocupado',
		'anoLectivo_anol_id',
		'curso_curs_id',
		'disciplina_disc_id',
		'entidade_enti_id',
		'juri1_doce_id',
		'juri2_doce_id',
		'sala_sala_id'
	];

	public function anolectivo()
	{
		return $this->belongsTo(Anolectivo::class, 'anoLectivo_anol_id');
	}

	public function docente()
	{
		return $this->belongsTo(Docente::class, 'juri1_doce_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function sala()
	{
		return $this->belongsTo(Sala::class, 'sala_sala_id');
	}

	public function curso()
	{
		return $this->belongsTo(Curso::class, 'curso_curs_id');
	}

	public function disciplina()
	{
		return $this->belongsTo(Disciplina::class, 'disciplina_disc_id');
	}

	public function exames()
	{
		return $this->hasMany(Exame::class, 'salaExame_salae_id');
	}
}
