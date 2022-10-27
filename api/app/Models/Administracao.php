<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Administracao
 * 
 * @property int $adm_id
 * @property string|null $adm_nome
 * @property bool $encrypted
 * @property int|null $empresa_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Departamento[] $departamentos
 *
 * @package App\Models
 */
class Administracao extends Model
{
	protected $table = 'administracao';
	protected $primaryKey = 'adm_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'empresa_enti_id' => 'int'
	];

	protected $fillable = [
		'adm_nome',
		'encrypted',
		'empresa_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'empresa_enti_id');
	}

	public function departamentos()
	{
		return $this->hasMany(Departamento::class, 'administracao_adm_id');
	}
}
