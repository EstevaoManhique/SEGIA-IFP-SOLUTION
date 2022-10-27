<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Sector
 * 
 * @property int $sec_id
 * @property bool $encrypted
 * @property string|null $sec_nome
 * @property int|null $Entidade_enti_id
 * @property int|null $departamento_dep_id
 * 
 * @property Entidade|null $entidade
 * @property Departamento|null $departamento
 *
 * @package App\Models
 */
class Sector extends Model
{
	protected $table = 'sector';
	protected $primaryKey = 'sec_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int',
		'departamento_dep_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'sec_nome',
		'Entidade_enti_id',
		'departamento_dep_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function departamento()
	{
		return $this->belongsTo(Departamento::class, 'departamento_dep_id');
	}
}
