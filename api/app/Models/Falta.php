<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Falta
 * 
 * @property int $flt_id
 * @property bool $encrypted
 * @property Carbon|null $flt_data
 * @property Carbon|null $flt_dataJustificacao
 * @property string|null $flt_descricao
 * @property string|null $flt_status
 * @property int|null $Entidade_enti_id
 * @property int|null $funcionario_func_id
 * 
 * @property Entidade|null $entidade
 * @property Funcionario|null $funcionario
 *
 * @package App\Models
 */
class Falta extends Model
{
	protected $table = 'faltas';
	protected $primaryKey = 'flt_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int',
		'funcionario_func_id' => 'int'
	];

	protected $dates = [
		'flt_data',
		'flt_dataJustificacao'
	];

	protected $fillable = [
		'encrypted',
		'flt_data',
		'flt_dataJustificacao',
		'flt_descricao',
		'flt_status',
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
