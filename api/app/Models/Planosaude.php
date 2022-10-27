<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Planosaude
 * 
 * @property int $pls_id
 * @property bool $encrypted
 * @property string|null $pls_avaliacao
 * @property Carbon|null $pls_data
 * @property string|null $pls_descricao
 * @property string|null $pls_medico
 * @property int|null $Entidade_enti_id
 * @property int|null $funcionario_func_id
 * 
 * @property Entidade|null $entidade
 * @property Funcionario|null $funcionario
 *
 * @package App\Models
 */
class Planosaude extends Model
{
	protected $table = 'planosaude';
	protected $primaryKey = 'pls_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int',
		'funcionario_func_id' => 'int'
	];

	protected $dates = [
		'pls_data'
	];

	protected $fillable = [
		'encrypted',
		'pls_avaliacao',
		'pls_data',
		'pls_descricao',
		'pls_medico',
		'Entidade_enti_id',
		'funcionario_func_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'funcionario_func_id');
	}
}
