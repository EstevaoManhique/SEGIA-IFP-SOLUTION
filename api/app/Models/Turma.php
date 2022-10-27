<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Turma
 * 
 * @property int $turm_id
 * @property bool $encrypted
 * @property Carbon|null $turm_dataFim
 * @property Carbon|null $turm_dataInicio
 * @property string|null $turm_descricao
 * @property string|null $turm_horario
 * @property int $turm_maxEstudantes
 * @property int $turm_minEstudantes
 * @property int $turm_numOcupado
 * @property string|null $turm_referencia
 * @property string|null $turm_turno
 * @property int|null $anoLectivo_anol_id
 * @property int|null $curso_curs_id
 * @property int|null $entidade_enti_id
 * @property int|null $escola_esc_id
 * @property int|null $sala_sala_id
 * 
 * @property Escola|null $escola
 * @property Anolectivo|null $anolectivo
 * @property Entidade|null $entidade
 * @property Curso|null $curso
 * @property Sala|null $sala
 * @property Collection|Agenda[] $agendas
 * @property Collection|Aluno[] $alunos
 * @property Collection|Calendario[] $calendarios
 * @property Collection|Docente[] $docentes
 * @property Collection|Fluxo[] $fluxos
 * @property Collection|Inscricao[] $inscricaos
 * @property Collection|Medium[] $media
 * @property Collection|Nota[] $notas
 * @property Collection|Pagamento[] $pagamentos
 * @property Collection|Presenca[] $presencas
 *
 * @package App\Models
 */
class Turma extends Model
{
	protected $table = 'turma';
	protected $primaryKey = 'turm_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'turm_maxEstudantes' => 'int',
		'turm_minEstudantes' => 'int',
		'turm_numOcupado' => 'int',
		'anoLectivo_anol_id' => 'int',
		'curso_curs_id' => 'int',
		'entidade_enti_id' => 'int',
		'escola_esc_id' => 'int',
		'sala_sala_id' => 'int'
	];

	protected $dates = [
		'turm_dataFim',
		'turm_dataInicio'
	];

	protected $fillable = [
		'encrypted',
		'turm_dataFim',
		'turm_dataInicio',
		'turm_descricao',
		'turm_horario',
		'turm_maxEstudantes',
		'turm_minEstudantes',
		'turm_numOcupado',
		'turm_referencia',
		'turm_turno',
		'anoLectivo_anol_id',
		'curso_curs_id',
		'entidade_enti_id',
		'escola_esc_id',
		'sala_sala_id'
	];

	public function escola()
	{
		return $this->belongsTo(Escola::class, 'escola_esc_id');
	}

	public function anolectivo()
	{
		return $this->belongsTo(Anolectivo::class, 'anoLectivo_anol_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function curso()
	{
		return $this->belongsTo(Curso::class, 'curso_curs_id');
	}

	public function sala()
	{
		return $this->belongsTo(Sala::class, 'sala_sala_id');
	}

	public function agendas()
	{
		return $this->hasMany(Agenda::class, 'turma_turm_id');
	}

	public function alunos()
	{
		return $this->hasMany(Aluno::class, 'turma_turm_id');
	}

	public function calendarios()
	{
		return $this->hasMany(Calendario::class, 'turma_turm_id');
	}

	public function docentes()
	{
		return $this->belongsToMany(Docente::class, 'docenteturma', 'turma_turm_id', 'docente_doce_id')
					->withPivot('doct_id', 'entidade_enti_id');
	}

	public function fluxos()
	{
		return $this->hasMany(Fluxo::class, 'turma_turm_id');
	}

	public function inscricaos()
	{
		return $this->hasMany(Inscricao::class, 'turma_turm_id');
	}

	public function media()
	{
		return $this->hasMany(Medium::class, 'turma_turm_id');
	}

	public function notas()
	{
		return $this->hasMany(Nota::class, 'turma_turm_id');
	}

	public function pagamentos()
	{
		return $this->hasMany(Pagamento::class, 'turma_turm_id');
	}

	public function presencas()
	{
		return $this->hasMany(Presenca::class, 'turma_turm_id');
	}
}
