<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Nota
 * 
 * @property int $nota_id
 * @property bool $encrypted
 * @property bool $isAcp2
 * @property bool $isTeste3
 * @property bool $isTeste4
 * @property float $nota_acp
 * @property float $nota_acp2
 * @property float $nota_avaliacaoContinua
 * @property float $nota_media
 * @property string|null $nota_semestre
 * @property float $nota_teste1
 * @property float $nota_teste2
 * @property float $nota_teste3
 * @property float $nota_teste4
 * @property float $nota_trabPratico
 * @property int|null $aluno_alun_id
 * @property int|null $anoLectivo_anol_id
 * @property int|null $disciplina_disc_id
 * @property int|null $entidade_enti_id
 * @property int|null $inscricao_insc_id
 * @property int|null $turma_turm_id
 * 
 * @property Inscricao|null $inscricao
 * @property Disciplina|null $disciplina
 * @property Entidade|null $entidade
 * @property Turma|null $turma
 * @property Aluno|null $aluno
 * @property Anolectivo|null $anolectivo
 *
 * @package App\Models
 */
class Nota extends Model
{
	protected $table = 'notas';
	protected $primaryKey = 'nota_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'isAcp2' => 'bool',
		'isTeste3' => 'bool',
		'isTeste4' => 'bool',
		'nota_acp' => 'float',
		'nota_acp2' => 'float',
		'nota_avaliacaoContinua' => 'float',
		'nota_media' => 'float',
		'nota_teste1' => 'float',
		'nota_teste2' => 'float',
		'nota_teste3' => 'float',
		'nota_teste4' => 'float',
		'nota_trabPratico' => 'float',
		'aluno_alun_id' => 'int',
		'anoLectivo_anol_id' => 'int',
		'disciplina_disc_id' => 'int',
		'entidade_enti_id' => 'int',
		'inscricao_insc_id' => 'int',
		'turma_turm_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'isAcp2',
		'isTeste3',
		'isTeste4',
		'nota_acp',
		'nota_acp2',
		'nota_avaliacaoContinua',
		'nota_media',
		'nota_semestre',
		'nota_teste1',
		'nota_teste2',
		'nota_teste3',
		'nota_teste4',
		'nota_trabPratico',
		'aluno_alun_id',
		'anoLectivo_anol_id',
		'disciplina_disc_id',
		'entidade_enti_id',
		'inscricao_insc_id',
		'turma_turm_id'
	];

	public function inscricao()
	{
		return $this->belongsTo(Inscricao::class, 'inscricao_insc_id');
	}

	public function disciplina()
	{
		return $this->belongsTo(Disciplina::class, 'disciplina_disc_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function turma()
	{
		return $this->belongsTo(Turma::class, 'turma_turm_id');
	}

	public function aluno()
	{
		return $this->belongsTo(Aluno::class, 'aluno_alun_id');
	}

	public function anolectivo()
	{
		return $this->belongsTo(Anolectivo::class, 'anoLectivo_anol_id');
	}
}
