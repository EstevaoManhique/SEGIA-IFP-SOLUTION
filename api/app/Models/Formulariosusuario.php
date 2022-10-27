<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Formulariosusuario
 * 
 * @property int $formu_id
 * @property bool $formu_d
 * @property bool $formu_i
 * @property bool $formu_u
 * @property bool $formu_v
 * @property int|null $formulario_form_id
 * @property int|null $moduloUsuario_modu_id
 * 
 * @property Modulousuario|null $modulousuario
 * @property Formulario|null $formulario
 *
 * @package App\Models
 */
class Formulariosusuario extends Model
{
	protected $table = 'formulariosusuario';
	protected $primaryKey = 'formu_id';
	public $timestamps = false;

	protected $casts = [
		'formu_d' => 'bool',
		'formu_i' => 'bool',
		'formu_u' => 'bool',
		'formu_v' => 'bool',
		'formulario_form_id' => 'int',
		'moduloUsuario_modu_id' => 'int'
	];

	protected $fillable = [
		'formu_d',
		'formu_i',
		'formu_u',
		'formu_v',
		'formulario_form_id',
		'moduloUsuario_modu_id'
	];

	public function modulousuario()
	{
		return $this->belongsTo(Modulousuario::class, 'moduloUsuario_modu_id');
	}

	public function formulario()
	{
		return $this->belongsTo(Formulario::class, 'formulario_form_id');
	}
}
