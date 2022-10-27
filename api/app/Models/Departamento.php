<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Departamento
 * 
 * @property int $dep_id
 * @property string|null $dep_nome
 * @property bool $encrypted
 * @property int|null $Entidade_enti_id
 * @property int|null $administracao_adm_id
 * @property int|null $nivelPrioridade_nvp_id
 * 
 * @property Entidade|null $entidade
 * @property Administracao|null $administracao
 * @property Nivelprioridade|null $nivelprioridade
 * @property Collection|Caixa[] $caixas
 * @property Collection|Doc[] $docs
 * @property Collection|Funcionario[] $funcionarios
 * @property Collection|Sector[] $sectors
 *
 * @package App\Models
 */
class Departamento extends Model
{
	protected $table = 'departamento';
	protected $primaryKey = 'dep_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int',
		'administracao_adm_id' => 'int',
		'nivelPrioridade_nvp_id' => 'int'
	];

	protected $fillable = [
		'dep_nome',
		'encrypted',
		'Entidade_enti_id',
		'administracao_adm_id',
		'nivelPrioridade_nvp_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function administracao()
	{
		return $this->belongsTo(Administracao::class, 'administracao_adm_id');
	}

	public function nivelprioridade()
	{
		return $this->belongsTo(Nivelprioridade::class, 'nivelPrioridade_nvp_id');
	}

	public function caixas()
	{
		return $this->hasMany(Caixa::class, 'departamento_dep_id');
	}

	public function docs()
	{
		return $this->hasMany(Doc::class, 'departamento_dep_id');
	}

	public function funcionarios()
	{
		return $this->hasMany(Funcionario::class, 'departamento_dep_id');
	}

	public function sectors()
	{
		return $this->hasMany(Sector::class, 'departamento_dep_id');
	}
}
