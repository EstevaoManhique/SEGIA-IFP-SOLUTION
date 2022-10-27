<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Log
 * 
 * @property int $log_id
 * @property bool $encrypted
 * @property Carbon|null $log_data
 * @property string|null $log_descricao
 * @property string|null $log_hora
 * @property int|null $entidade_enti_id
 * @property int|null $sistema_sist_id
 * @property int|null $usuario_usua_id
 * 
 * @property Sistema|null $sistema
 * @property Entidade|null $entidade
 * @property Usuario|null $usuario
 *
 * @package App\Models
 */
class Log extends Model
{
	protected $table = 'log';
	protected $primaryKey = 'log_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int',
		'sistema_sist_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $dates = [
		'log_data'
	];

	protected $fillable = [
		'encrypted',
		'log_data',
		'log_descricao',
		'log_hora',
		'entidade_enti_id',
		'sistema_sist_id',
		'usuario_usua_id'
	];

	public function sistema()
	{
		return $this->belongsTo(Sistema::class, 'sistema_sist_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}
}
