<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Hora
 * 
 * @property int $hora_id
 * @property bool $encrypted
 * @property string|null $hora_categoria
 * @property Carbon|null $hora_data
 * @property int $hora_duracao
 * @property string|null $hora_obseravoes
 * @property int|null $Entidade_enti_id
 * @property int|null $funcionario_func_id
 * 
 * @property Funcionario|null $funcionario
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Hora extends Model
{
	protected $table = 'horas';
	protected $primaryKey = 'hora_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'hora_duracao' => 'int',
		'Entidade_enti_id' => 'int',
		'funcionario_func_id' => 'int'
	];

	protected $dates = [
		'hora_data'
	];

	protected $fillable = [
		'encrypted',
		'hora_categoria',
		'hora_data',
		'hora_duracao',
		'hora_obseravoes',
		'Entidade_enti_id',
		'funcionario_func_id'
	];

	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'funcionario_func_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}
}
