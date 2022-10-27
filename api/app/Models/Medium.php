<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Medium
 * 
 * @property int $medi_id
 * @property bool $encrypted
 * @property string|null $med_semestre
 * @property float $medi_media
 * @property float $medi_media2
 * @property float $medi_media3
 * @property int|null $aluno_alun_id
 * @property int|null $anoLectivo_anol_id
 * @property int|null $disciplina_disc_id
 * @property int|null $entidade_enti_id
 * @property int|null $inscricao_insc_id
 * @property int|null $turma_turm_id
 * 
 * @property Entidade|null $entidade
 * @property Disciplina|null $disciplina
 * @property Aluno|null $aluno
 * @property Turma|null $turma
 * @property Inscricao|null $inscricao
 * @property Anolectivo|null $anolectivo
 *
 * @package App\Models
 */
class Medium extends Model
{
	protected $table = 'media';
	protected $primaryKey = 'medi_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'medi_media' => 'float',
		'medi_media2' => 'float',
		'medi_media3' => 'float',
		'aluno_alun_id' => 'int',
		'anoLectivo_anol_id' => 'int',
		'disciplina_disc_id' => 'int',
		'entidade_enti_id' => 'int',
		'inscricao_insc_id' => 'int',
		'turma_turm_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'med_semestre',
		'medi_media',
		'medi_media2',
		'medi_media3',
		'aluno_alun_id',
		'anoLectivo_anol_id',
		'disciplina_disc_id',
		'entidade_enti_id',
		'inscricao_insc_id',
		'turma_turm_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function disciplina()
	{
		return $this->belongsTo(Disciplina::class, 'disciplina_disc_id');
	}

	public function aluno()
	{
		return $this->belongsTo(Aluno::class, 'aluno_alun_id');
	}

	public function turma()
	{
		return $this->belongsTo(Turma::class, 'turma_turm_id');
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
