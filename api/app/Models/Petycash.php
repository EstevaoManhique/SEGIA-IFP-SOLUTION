<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Petycash
 * 
 * @property int $pet_id
 * @property bool $encrypted
 * @property Carbon|null $pet_data
 * @property string|null $pet_descricao
 * @property float $pet_saldoAnterior
 * @property float $pet_valor
 * @property int|null $entidade_enti_id
 * @property int|null $funcionario_func_id
 * @property int|null $pety_pety_id
 * @property int|null $usuario_usua_id
 * 
 * @property Usuario|null $usuario
 * @property Funcionario|null $funcionario
 * @property Pety|null $pety
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Petycash extends Model
{
	protected $table = 'petycash';
	protected $primaryKey = 'pet_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'pet_saldoAnterior' => 'float',
		'pet_valor' => 'float',
		'entidade_enti_id' => 'int',
		'funcionario_func_id' => 'int',
		'pety_pety_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $dates = [
		'pet_data'
	];

	protected $fillable = [
		'encrypted',
		'pet_data',
		'pet_descricao',
		'pet_saldoAnterior',
		'pet_valor',
		'entidade_enti_id',
		'funcionario_func_id',
		'pety_pety_id',
		'usuario_usua_id'
	];

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'funcionario_func_id');
	}

	public function pety()
	{
		return $this->belongsTo(Pety::class, 'pety_pety_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
