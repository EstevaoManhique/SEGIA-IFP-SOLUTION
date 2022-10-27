<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Tipousuario
 * 
 * @property int $tipu_id
 * @property bool $encrypted
 * @property string|null $tipu_descricao
 * @property int|null $nivelAcessoniva_niva_id
 * 
 * @property Nivelacesso|null $nivelacesso
 * @property Collection|Usuario[] $usuarios
 *
 * @package App\Models
 */
class Tipousuario extends Model
{
	protected $table = 'tipousuario';
	protected $primaryKey = 'tipu_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'nivelAcessoniva_niva_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'tipu_descricao',
		'nivelAcessoniva_niva_id'
	];

	public function nivelacesso()
	{
		return $this->belongsTo(Nivelacesso::class, 'nivelAcessoniva_niva_id');
	}

	public function usuarios()
	{
		return $this->hasMany(Usuario::class, 'tipoUsuariotipu_tipu_id');
	}
}
