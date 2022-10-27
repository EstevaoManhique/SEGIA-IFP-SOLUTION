<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Fecho
 * 
 * @property int $fech_id
 * @property bool $encrypted
 * @property Carbon|null $fech_data
 * @property string|null $fech_referencia
 * @property int|null $entidade_enti_id
 * @property int|null $usuario_usua_id
 * 
 * @property Usuario|null $usuario
 * @property Entidade|null $entidade
 * @property Collection|Registofecho[] $registofechos
 *
 * @package App\Models
 */
class Fecho extends Model
{
	protected $table = 'fecho';
	protected $primaryKey = 'fech_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $dates = [
		'fech_data'
	];

	protected $fillable = [
		'encrypted',
		'fech_data',
		'fech_referencia',
		'entidade_enti_id',
		'usuario_usua_id'
	];

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function registofechos()
	{
		return $this->hasMany(Registofecho::class, 'fecho_fech_id');
	}
}
