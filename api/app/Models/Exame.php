<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Exame
 * 
 * @property int $exam_id
 * @property bool $encrypted
 * @property bool $exam_extraodinario
 * @property bool $exam_fraude
 * @property float $exam_media
 * @property bool $exam_naRecorrencia
 * @property float $exam_nota
 * @property float $exam_notaFinal
 * @property bool $exam_presenca
 * @property float $exam_recorrencia
 * @property string|null $exam_semestre
 * @property int|null $aluno_alun_id
 * @property int|null $anoLectivo_anol_id
 * @property int|null $disciplina_disc_id
 * @property int|null $entidade_enti_id
 * @property int|null $inscricao_insc_id
 * @property int|null $salaExame_salae_id
 * 
 * @property Disciplina|null $disciplina
 * @property Salaexame|null $salaexame
 * @property Aluno|null $aluno
 * @property Entidade|null $entidade
 * @property Inscricao|null $inscricao
 * @property Anolectivo|null $anolectivo
 *
 * @package App\Models
 */
class Exame extends Model
{
	protected $table = 'exame';
	protected $primaryKey = 'exam_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'exam_extraodinario' => 'bool',
		'exam_fraude' => 'bool',
		'exam_media' => 'float',
		'exam_naRecorrencia' => 'bool',
		'exam_nota' => 'float',
		'exam_notaFinal' => 'float',
		'exam_presenca' => 'bool',
		'exam_recorrencia' => 'float',
		'aluno_alun_id' => 'int',
		'anoLectivo_anol_id' => 'int',
		'disciplina_disc_id' => 'int',
		'entidade_enti_id' => 'int',
		'inscricao_insc_id' => 'int',
		'salaExame_salae_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'exam_extraodinario',
		'exam_fraude',
		'exam_media',
		'exam_naRecorrencia',
		'exam_nota',
		'exam_notaFinal',
		'exam_presenca',
		'exam_recorrencia',
		'exam_semestre',
		'aluno_alun_id',
		'anoLectivo_anol_id',
		'disciplina_disc_id',
		'entidade_enti_id',
		'inscricao_insc_id',
		'salaExame_salae_id'
	];

	public function disciplina()
	{
		return $this->belongsTo(Disciplina::class, 'disciplina_disc_id');
	}

	public function salaexame()
	{
		return $this->belongsTo(Salaexame::class, 'salaExame_salae_id');
	}

	public function aluno()
	{
		return $this->belongsTo(Aluno::class, 'aluno_alun_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function inscricao()
	{
		return $this->belongsTo(Inscricao::class, 'inscricao_insc_id');
	}

	public function anolectivo()
	{
		return $this->belongsTo(Anolectivo::class, 'anoLectivo_anol_id');
	}
}
