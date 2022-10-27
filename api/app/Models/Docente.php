<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Docente
 * 
 * @property int $doce_id
 * @property bool $doce_activo
 * @property string|null $doce_categoria
 * @property string|null $doce_especialidade
 * @property string|null $doce_grauFormacao
 * @property string|null $doce_provincia
 * @property string|null $doce_senha
 * @property string|null $doce_tipoContrato
 * @property string|null $doce_usuario
 * @property Carbon|null $doce_validadeContrato
 * @property bool $encrypted
 * @property int|null $areaFormacao_aref_id
 * @property int|null $entidade_enti_id
 * @property int|null $pessoa_pess_id
 * 
 * @property Entidade|null $entidade
 * @property Areaformacao|null $areaformacao
 * @property Pessoa|null $pessoa
 * @property Collection|Calendario[] $calendarios
 * @property Collection|Disciplina[] $disciplinas
 * @property Collection|Turma[] $turmas
 * @property Collection|Salaexame[] $salaexames
 *
 * @package App\Models
 */
class Docente extends Model
{
	protected $table = 'docente';
	protected $primaryKey = 'doce_id';
	public $timestamps = false;

	protected $casts = [
		'doce_activo' => 'bool',
		'encrypted' => 'bool',
		'areaFormacao_aref_id' => 'int',
		'entidade_enti_id' => 'int',
		'pessoa_pess_id' => 'int'
	];

	protected $dates = [
		'doce_validadeContrato'
	];

	protected $fillable = [
		'doce_activo',
		'doce_categoria',
		'doce_especialidade',
		'doce_grauFormacao',
		'doce_provincia',
		'doce_senha',
		'doce_tipoContrato',
		'doce_usuario',
		'doce_validadeContrato',
		'encrypted',
		'areaFormacao_aref_id',
		'entidade_enti_id',
		'pessoa_pess_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function areaformacao()
	{
		return $this->belongsTo(Areaformacao::class, 'areaFormacao_aref_id');
	}

	public function pessoa()
	{
		return $this->belongsTo(Pessoa::class, 'pessoa_pess_id');
	}

	public function calendarios()
	{
		return $this->hasMany(Calendario::class, 'juri3_doce_id');
	}

	public function disciplinas()
	{
		return $this->belongsToMany(Disciplina::class, 'disciplinadocente', 'docente_doce_id', 'disciplina_disc_id')
					->withPivot('disd_id', 'entidade_enti_id');
	}

	public function turmas()
	{
		return $this->belongsToMany(Turma::class, 'docenteturma', 'docente_doce_id', 'turma_turm_id')
					->withPivot('doct_id', 'entidade_enti_id');
	}

	public function salaexames()
	{
		return $this->hasMany(Salaexame::class, 'juri1_doce_id');
	}
}
