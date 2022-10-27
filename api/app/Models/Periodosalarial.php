<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Periodosalarial
 * 
 * @property int $pers_id
 * @property bool $encrypted
 * @property Carbon|null $pers_data
 * @property string|null $pers_descricao
 * @property int|null $entidade_enti_id
 * @property int|null $usuario_usua_id
 * @property int|null $usuarioAutoriza_usua_id
 * @property int|null $usuarioVerifica_usua_id
 * 
 * @property Usuario|null $usuario
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Periodosalarial extends Model
{
	protected $table = 'periodosalarial';
	protected $primaryKey = 'pers_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int',
		'usuario_usua_id' => 'int',
		'usuarioAutoriza_usua_id' => 'int',
		'usuarioVerifica_usua_id' => 'int'
	];

	protected $dates = [
		'pers_data'
	];

	protected $fillable = [
		'encrypted',
		'pers_data',
		'pers_descricao',
		'entidade_enti_id',
		'usuario_usua_id',
		'usuarioAutoriza_usua_id',
		'usuarioVerifica_usua_id'
	];

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuarioAutoriza_usua_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
