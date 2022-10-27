<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Moduloacesso
 * 
 * @property int $moac_id
 * @property bool $encrypted
 * @property string|null $moac_baseDados
 * @property string|null $moac_chaveAcesso
 * @property string|null $moac_chaveUsuarios
 * @property Carbon|null $moac_dataActivacao
 * @property Carbon|null $moac_dataFinalTrial
 * @property string|null $moac_dataFinalTrialEncry
 * @property int|null $moac_diasRemanescentes
 * @property string|null $moac_diasRemanescentesEncry
 * @property string|null $moac_imagemFundo
 * @property string|null $moac_perfilCores
 * @property int|null $entidadeenti_enti_id
 * @property int|null $sistema_sist_id
 * 
 * @property Sistema|null $sistema
 * @property Entidade|null $entidade
 * @property Collection|Modulousuario[] $modulousuarios
 *
 * @package App\Models
 */
class Moduloacesso extends Model
{
	protected $table = 'moduloacesso';
	protected $primaryKey = 'moac_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'moac_diasRemanescentes' => 'int',
		'entidadeenti_enti_id' => 'int',
		'sistema_sist_id' => 'int'
	];

	protected $dates = [
		'moac_dataActivacao',
		'moac_dataFinalTrial'
	];

	protected $fillable = [
		'encrypted',
		'moac_baseDados',
		'moac_chaveAcesso',
		'moac_chaveUsuarios',
		'moac_dataActivacao',
		'moac_dataFinalTrial',
		'moac_dataFinalTrialEncry',
		'moac_diasRemanescentes',
		'moac_diasRemanescentesEncry',
		'moac_imagemFundo',
		'moac_perfilCores',
		'entidadeenti_enti_id',
		'sistema_sist_id'
	];

	public function sistema()
	{
		return $this->belongsTo(Sistema::class, 'sistema_sist_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidadeenti_enti_id');
	}

	public function modulousuarios()
	{
		return $this->hasMany(Modulousuario::class, 'moduloAcesso_moac_id');
	}
}
