<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Curso
 * 
 * @property int $curs_id
 * @property int $curs_aprovacoes
 * @property string|null $curs_cod
 * @property float $curs_custoInscricao
 * @property string|null $curs_descricao
 * @property int $curs_duracao
 * @property bool $curs_exame
 * @property int $curs_inscritos
 * @property int $curs_numPrestacoes
 * @property int $curs_numTurmas
 * @property float $curs_preco
 * @property int $curs_reprovacoes
 * @property string|null $curs_tipo
 * @property bool $encrypted
 * @property int|null $areaFormacao_aref_id
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Areaformacao|null $areaformacao
 * @property Collection|Calendario[] $calendarios
 * @property Collection|Calendarioexame[] $calendarioexames
 * @property Collection|Disciplina[] $disciplinas
 * @property Collection|Inscricao[] $inscricaos
 * @property Collection|Mensalidade[] $mensalidades
 * @property Collection|Modulo[] $modulos
 * @property Collection|Respostum[] $resposta
 * @property Collection|Salaexame[] $salaexames
 * @property Collection|Sumario[] $sumarios
 * @property Collection|Tema[] $temas
 * @property Collection|Turma[] $turmas
 * @property Collection|Vaga[] $vagas
 *
 * @package App\Models
 */
class Curso extends Model
{
	protected $table = 'curso';
	protected $primaryKey = 'curs_id';
	public $timestamps = false;

	protected $casts = [
		'curs_aprovacoes' => 'int',
		'curs_custoInscricao' => 'float',
		'curs_duracao' => 'int',
		'curs_exame' => 'bool',
		'curs_inscritos' => 'int',
		'curs_numPrestacoes' => 'int',
		'curs_numTurmas' => 'int',
		'curs_preco' => 'float',
		'curs_reprovacoes' => 'int',
		'encrypted' => 'bool',
		'areaFormacao_aref_id' => 'int',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'curs_aprovacoes',
		'curs_cod',
		'curs_custoInscricao',
		'curs_descricao',
		'curs_duracao',
		'curs_exame',
		'curs_inscritos',
		'curs_numPrestacoes',
		'curs_numTurmas',
		'curs_preco',
		'curs_reprovacoes',
		'curs_tipo',
		'encrypted',
		'areaFormacao_aref_id',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function areaformacao()
	{
		return $this->belongsTo(Areaformacao::class, 'areaFormacao_aref_id');
	}

	public function calendarios()
	{
		return $this->hasMany(Calendario::class, 'curso_curs_id');
	}

	public function calendarioexames()
	{
		return $this->hasMany(Calendarioexame::class, 'curso_curs_id');
	}

	public function disciplinas()
	{
		return $this->belongsToMany(Disciplina::class, 'disciplinacurso', 'curso_curs_id', 'disciplina_disc_id')
					->withPivot('disd_id', 'disd_semestre', 'encrypted', 'entidade_enti_id');
	}

	public function inscricaos()
	{
		return $this->hasMany(Inscricao::class, 'curso_curs_id');
	}

	public function mensalidades()
	{
		return $this->hasMany(Mensalidade::class, 'curso_curs_id');
	}

	public function modulos()
	{
		return $this->hasMany(Modulo::class, 'curso_curs_id');
	}

	public function resposta()
	{
		return $this->hasMany(Respostum::class, 'curso_curs_id');
	}

	public function salaexames()
	{
		return $this->hasMany(Salaexame::class, 'curso_curs_id');
	}

	public function sumarios()
	{
		return $this->hasMany(Sumario::class, 'curso_curs_id');
	}

	public function temas()
	{
		return $this->hasMany(Tema::class, 'curso_curs_id');
	}

	public function turmas()
	{
		return $this->hasMany(Turma::class, 'curso_curs_id');
	}

	public function vagas()
	{
		return $this->hasMany(Vaga::class, 'curso_curs_id');
	}
}
