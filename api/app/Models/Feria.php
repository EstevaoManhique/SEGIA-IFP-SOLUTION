<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Feria
 * 
 * @property int $fer_id
 * @property bool $encrypted
 * @property Carbon|null $fer_datafim
 * @property Carbon|null $fer_datainicio
 * @property string|null $fer_observacoes
 * @property int|null $Entidade_enti_id
 * @property int|null $funcionario_func_id
 * 
 * @property Funcionario|null $funcionario
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Feria extends Model
{
	protected $table = 'ferias';
	protected $primaryKey = 'fer_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int',
		'funcionario_func_id' => 'int'
	];

	protected $dates = [
		'fer_datafim',
		'fer_datainicio'
	];

	protected $fillable = [
		'encrypted',
		'fer_datafim',
		'fer_datainicio',
		'fer_observacoes',
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
