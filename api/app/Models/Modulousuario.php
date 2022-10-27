<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Modulousuario
 * 
 * @property int $modu_id
 * @property bool $encrypted
 * @property Carbon|null $modu_dataUltimoLogin
 * @property string|null $modu_referencia
 * @property int $modu_visitas
 * @property int|null $moduloAcesso_moac_id
 * @property int|null $usuario_usua_id
 * 
 * @property Moduloacesso|null $moduloacesso
 * @property Usuario|null $usuario
 * @property Collection|Formulariosusuario[] $formulariosusuarios
 *
 * @package App\Models
 */
class Modulousuario extends Model
{
	protected $table = 'modulousuario';
	protected $primaryKey = 'modu_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'modu_visitas' => 'int',
		'moduloAcesso_moac_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $dates = [
		'modu_dataUltimoLogin'
	];

	protected $fillable = [
		'encrypted',
		'modu_dataUltimoLogin',
		'modu_referencia',
		'modu_visitas',
		'moduloAcesso_moac_id',
		'usuario_usua_id'
	];

	public function moduloacesso()
	{
		return $this->belongsTo(Moduloacesso::class, 'moduloAcesso_moac_id');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function formulariosusuarios()
	{
		return $this->hasMany(Formulariosusuario::class, 'moduloUsuario_modu_id');
	}
}
