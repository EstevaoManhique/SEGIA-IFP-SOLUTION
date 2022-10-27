<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Contracto
 * 
 * @property int $cnt_id
 * @property string|null $cnt_agencia
 * @property string|null $cnt_banco
 * @property string|null $cnt_beneficios
 * @property int $cnt_conta
 * @property Carbon|null $cnt_dataadmissao
 * @property Carbon|null $cnt_datafim
 * @property Carbon|null $cnt_datainicio
 * @property string|null $cnt_graohierarquico
 * @property string|null $cnt_horassemanais
 * @property float $cnt_salario
 * @property bool $encrypted
 * @property int|null $Entidade_enti_id
 * @property int|null $clienteclie_clie_id
 * @property int|null $funcionario_func_id
 * @property int|null $servicoserv_serv_id
 * 
 * @property Funcionario|null $funcionario
 * @property Cliente|null $cliente
 * @property Entidade|null $entidade
 * @property Servico|null $servico
 *
 * @package App\Models
 */
class Contracto extends Model
{
	protected $table = 'contracto';
	protected $primaryKey = 'cnt_id';
	public $timestamps = false;

	protected $casts = [
		'cnt_conta' => 'int',
		'cnt_salario' => 'float',
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int',
		'clienteclie_clie_id' => 'int',
		'funcionario_func_id' => 'int',
		'servicoserv_serv_id' => 'int'
	];

	protected $dates = [
		'cnt_dataadmissao',
		'cnt_datafim',
		'cnt_datainicio'
	];

	protected $fillable = [
		'cnt_agencia',
		'cnt_banco',
		'cnt_beneficios',
		'cnt_conta',
		'cnt_dataadmissao',
		'cnt_datafim',
		'cnt_datainicio',
		'cnt_graohierarquico',
		'cnt_horassemanais',
		'cnt_salario',
		'encrypted',
		'Entidade_enti_id',
		'clienteclie_clie_id',
		'funcionario_func_id',
		'servicoserv_serv_id'
	];

	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'funcionario_func_id');
	}

	public function cliente()
	{
		return $this->belongsTo(Cliente::class, 'clienteclie_clie_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function servico()
	{
		return $this->belongsTo(Servico::class, 'servicoserv_serv_id');
	}
}
