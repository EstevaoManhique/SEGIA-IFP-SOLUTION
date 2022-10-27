<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Inscricao
 * 
 * @property int $insc_id
 * @property bool $insc_activa
 * @property string|null $insc_anoLectivo
 * @property string|null $insc_categoria
 * @property bool $insc_certificado
 * @property string|null $insc_comp1
 * @property string|null $insc_comp2
 * @property string|null $insc_comp3
 * @property string|null $insc_comp4
 * @property string|null $insc_condicao
 * @property bool $insc_copiaBI
 * @property Carbon|null $insc_dataInscricao
 * @property Carbon|null $insc_dataProximoPagamento
 * @property Carbon|null $insc_dataUltimoPagamento
 * @property int $insc_faltas
 * @property int $insc_faltasJustificadas
 * @property bool $insc_fotos
 * @property float $insc_notaFinal
 * @property string|null $insc_nrTransfercia
 * @property string|null $insc_origem
 * @property bool $insc_ppf
 * @property string|null $insc_referencia
 * @property bool $insc_regular
 * @property string|null $insc_semestre
 * @property string|null $insc_turno
 * @property int|null $aluno_alun_id
 * @property int|null $anoLectivo_anol_id
 * @property int|null $curso_curs_id
 * @property int|null $entidade_enti_id
 * @property int|null $turma_turm_id
 * @property int|null $turno_turn_id
 * 
 * @property Turma|null $turma
 * @property Anolectivo|null $anolectivo
 * @property Entidade|null $entidade
 * @property Curso|null $curso
 * @property Aluno|null $aluno
 * @property Turno|null $turno
 * @property Collection|Boletim[] $boletims
 * @property Collection|Exame[] $exames
 * @property Collection|Medium[] $media
 * @property Collection|Nota[] $notas
 * @property Collection|Pagamento[] $pagamentos
 *
 * @package App\Models
 */
class Inscricao extends Model
{
	protected $table = 'inscricao';
	protected $primaryKey = 'insc_id';
	public $timestamps = false;

	protected $casts = [
		'insc_activa' => 'bool',
		'insc_certificado' => 'bool',
		'insc_copiaBI' => 'bool',
		'insc_faltas' => 'int',
		'insc_faltasJustificadas' => 'int',
		'insc_fotos' => 'bool',
		'insc_notaFinal' => 'float',
		'insc_ppf' => 'bool',
		'insc_regular' => 'bool',
		'aluno_alun_id' => 'int',
		'anoLectivo_anol_id' => 'int',
		'curso_curs_id' => 'int',
		'entidade_enti_id' => 'int',
		'turma_turm_id' => 'int',
		'turno_turn_id' => 'int'
	];

	protected $dates = [
		'insc_dataInscricao',
		'insc_dataProximoPagamento',
		'insc_dataUltimoPagamento'
	];

	protected $fillable = [
		'insc_activa',
		'insc_anoLectivo',
		'insc_categoria',
		'insc_certificado',
		'insc_comp1',
		'insc_comp2',
		'insc_comp3',
		'insc_comp4',
		'insc_condicao',
		'insc_copiaBI',
		'insc_dataInscricao',
		'insc_dataProximoPagamento',
		'insc_dataUltimoPagamento',
		'insc_faltas',
		'insc_faltasJustificadas',
		'insc_fotos',
		'insc_notaFinal',
		'insc_nrTransfercia',
		'insc_origem',
		'insc_ppf',
		'insc_referencia',
		'insc_regular',
		'insc_semestre',
		'insc_turno',
		'aluno_alun_id',
		'anoLectivo_anol_id',
		'curso_curs_id',
		'entidade_enti_id',
		'turma_turm_id',
		'turno_turn_id'
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

	public function curso()
	{
		return $this->belongsTo(Curso::class, 'curso_curs_id');
	}

	public function aluno()
	{
		return $this->belongsTo(Aluno::class, 'aluno_alun_id');
	}

	public function turno()
	{
		return $this->belongsTo(Turno::class, 'turno_turn_id');
	}

	public function boletims()
	{
		return $this->hasMany(Boletim::class, 'inscricao_insc_id');
	}

	public function exames()
	{
		return $this->hasMany(Exame::class, 'inscricao_insc_id');
	}

	public function media()
	{
		return $this->hasMany(Medium::class, 'inscricao_insc_id');
	}

	public function notas()
	{
		return $this->hasMany(Nota::class, 'inscricao_insc_id');
	}

	public function pagamentos()
	{
		return $this->hasMany(Pagamento::class, 'inscricao_insc_id');
	}
}
