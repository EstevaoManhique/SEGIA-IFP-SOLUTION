<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Sistema
 * 
 * @property int $sist_id
 * @property bool $encrypted
 * @property string|null $sist_descricao
 * @property bool $sist_estado
 * @property string|null $sist_url
 * 
 * @property Collection|Formulario[] $formularios
 * @property Collection|Log[] $logs
 * @property Collection|Moduloacesso[] $moduloacessos
 * @property Collection|Trial[] $trials
 *
 * @package App\Models
 */
class Sistema extends Model
{
	protected $table = 'sistema';
	protected $primaryKey = 'sist_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'sist_estado' => 'bool'
	];

	protected $fillable = [
		'encrypted',
		'sist_descricao',
		'sist_estado',
		'sist_url'
	];

	public function formularios()
	{
		return $this->hasMany(Formulario::class, 'sistema_sist_id');
	}

	public function logs()
	{
		return $this->hasMany(Log::class, 'sistema_sist_id');
	}

	public function moduloacessos()
	{
		return $this->hasMany(Moduloacesso::class, 'sistema_sist_id');
	}

	public function trials()
	{
		return $this->hasMany(Trial::class, 'sistema_sist_id');
	}
}
