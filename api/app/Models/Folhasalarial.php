<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Folhasalarial
 * 
 * @property int $fls_id
 * @property bool $encrypted
 * @property float $fls_IRPS
 * @property float $fls_bonus
 * @property float $fls_coeficiente
 * @property Carbon|null $fls_data
 * @property float $fls_dependentes
 * @property float $fls_desconto
 * @property float $fls_limiteInferior
 * @property string|null $fls_periodo
 * @property string|null $fls_referencia
 * @property float $fls_salario
 * @property int|null $entidade_enti_id
 * @property int|null $funcionario_func_id
 * 
 * @property Funcionario|null $funcionario
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Folhasalarial extends Model
{
	protected $table = 'folhasalarial';
	protected $primaryKey = 'fls_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'fls_IRPS' => 'float',
		'fls_bonus' => 'float',
		'fls_coeficiente' => 'float',
		'fls_dependentes' => 'float',
		'fls_desconto' => 'float',
		'fls_limiteInferior' => 'float',
		'fls_salario' => 'float',
		'entidade_enti_id' => 'int',
		'funcionario_func_id' => 'int'
	];

	protected $dates = [
		'fls_data'
	];

	protected $fillable = [
		'encrypted',
		'fls_IRPS',
		'fls_bonus',
		'fls_coeficiente',
		'fls_data',
		'fls_dependentes',
		'fls_desconto',
		'fls_limiteInferior',
		'fls_periodo',
		'fls_referencia',
		'fls_salario',
		'entidade_enti_id',
		'funcionario_func_id'
	];

	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'funcionario_func_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
