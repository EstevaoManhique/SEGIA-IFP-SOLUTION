<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Calendario
 * 
 * @property int $cale_id
 * @property Carbon|null $cale_acp
 * @property Carbon|null $cale_acp2
 * @property Carbon|null $cale_acp2Limite
 * @property Carbon|null $cale_acpLimite
 * @property Carbon|null $cale_exame
 * @property Carbon|null $cale_exameLimite
 * @property bool $cale_haveAcp
 * @property bool $cale_haveExame
 * @property bool $cale_haveTeste3
 * @property bool $cale_haveTeste4
 * @property Carbon|null $cale_recorrencia
 * @property Carbon|null $cale_recorrenciaLimite
 * @property string|null $cale_semestre
 * @property Carbon|null $cale_teste1
 * @property Carbon|null $cale_teste1Limite
 * @property Carbon|null $cale_teste2
 * @property Carbon|null $cale_teste2Limite
 * @property Carbon|null $cale_teste3
 * @property Carbon|null $cale_teste3Limite
 * @property Carbon|null $cale_teste4
 * @property Carbon|null $cale_teste4Limite
 * @property bool $encrypted
 * @property int|null $anoLectivo_anol_id
 * @property int|null $curso_curs_id
 * @property int|null $disciplina_disc_id
 * @property int|null $docente_doce_id
 * @property int|null $entidade_enti_id
 * @property int|null $juri1_doce_id
 * @property int|null $juri2_doce_id
 * @property int|null $juri3_doce_id
 * @property int|null $juri4_doce_id
 * @property int|null $turma_turm_id
 * 
 * @property Anolectivo|null $anolectivo
 * @property Docente|null $docente
 * @property Turma|null $turma
 * @property Disciplina|null $disciplina
 * @property Entidade|null $entidade
 * @property Curso|null $curso
 *
 * @package App\Models
 */
class Calendario extends Model
{
	protected $table = 'calendario';
	protected $primaryKey = 'cale_id';
	public $timestamps = false;

	protected $casts = [
		'cale_haveAcp' => 'bool',
		'cale_haveExame' => 'bool',
		'cale_haveTeste3' => 'bool',
		'cale_haveTeste4' => 'bool',
		'encrypted' => 'bool',
		'anoLectivo_anol_id' => 'int',
		'curso_curs_id' => 'int',
		'disciplina_disc_id' => 'int',
		'docente_doce_id' => 'int',
		'entidade_enti_id' => 'int',
		'juri1_doce_id' => 'int',
		'juri2_doce_id' => 'int',
		'juri3_doce_id' => 'int',
		'juri4_doce_id' => 'int',
		'turma_turm_id' => 'int'
	];

	protected $dates = [
		'cale_acp',
		'cale_acp2',
		'cale_acp2Limite',
		'cale_acpLimite',
		'cale_exame',
		'cale_exameLimite',
		'cale_recorrencia',
		'cale_recorrenciaLimite',
		'cale_teste1',
		'cale_teste1Limite',
		'cale_teste2',
		'cale_teste2Limite',
		'cale_teste3',
		'cale_teste3Limite',
		'cale_teste4',
		'cale_teste4Limite'
	];

	protected $fillable = [
		'cale_acp',
		'cale_acp2',
		'cale_acp2Limite',
		'cale_acpLimite',
		'cale_exame',
		'cale_exameLimite',
		'cale_haveAcp',
		'cale_haveExame',
		'cale_haveTeste3',
		'cale_haveTeste4',
		'cale_recorrencia',
		'cale_recorrenciaLimite',
		'cale_semestre',
		'cale_teste1',
		'cale_teste1Limite',
		'cale_teste2',
		'cale_teste2Limite',
		'cale_teste3',
		'cale_teste3Limite',
		'cale_teste4',
		'cale_teste4Limite',
		'encrypted',
		'anoLectivo_anol_id',
		'curso_curs_id',
		'disciplina_disc_id',
		'docente_doce_id',
		'entidade_enti_id',
		'juri1_doce_id',
		'juri2_doce_id',
		'juri3_doce_id',
		'juri4_doce_id',
		'turma_turm_id'
	];

	public function anolectivo()
	{
		return $this->belongsTo(Anolectivo::class, 'anoLectivo_anol_id');
	}

	public function docente()
	{
		return $this->belongsTo(Docente::class, 'juri3_doce_id');
	}

	public function turma()
	{
		return $this->belongsTo(Turma::class, 'turma_turm_id');
	}

	public function disciplina()
	{
		return $this->belongsTo(Disciplina::class, 'disciplina_disc_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function curso()
	{
		return $this->belongsTo(Curso::class, 'curso_curs_id');
	}
}
