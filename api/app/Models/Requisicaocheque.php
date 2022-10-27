<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Requisicaocheque
 * 
 * @property int $rqc_id
 * @property bool $encrypted
 * @property string|null $rpc_beneficiario
 * @property string|null $rpc_criterio
 * @property string|null $rpc_descricao
 * @property string|null $rpc_movimento
 * @property Carbon|null $rqc_data
 * @property string|null $rqc_nrCheque
 * @property string|null $rqc_serie
 * @property float $rqc_valor
 * @property string|null $rqc_valorExtenso
 * @property int|null $entidade_enti_id
 * @property int|null $funcionario_func_id
 * @property int|null $tipoMovimentoCheque_tmc_id
 * @property int|null $usuario_usua_id
 * 
 * @property Funcionario|null $funcionario
 * @property Entidade|null $entidade
 * @property Usuario|null $usuario
 * @property Tipomovimentocheque|null $tipomovimentocheque
 * @property Collection|Itemrequisicaocheque[] $itemrequisicaocheques
 *
 * @package App\Models
 */
class Requisicaocheque extends Model
{
	protected $table = 'requisicaocheque';
	protected $primaryKey = 'rqc_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'rqc_valor' => 'float',
		'entidade_enti_id' => 'int',
		'funcionario_func_id' => 'int',
		'tipoMovimentoCheque_tmc_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $dates = [
		'rqc_data'
	];

	protected $fillable = [
		'encrypted',
		'rpc_beneficiario',
		'rpc_criterio',
		'rpc_descricao',
		'rpc_movimento',
		'rqc_data',
		'rqc_nrCheque',
		'rqc_serie',
		'rqc_valor',
		'rqc_valorExtenso',
		'entidade_enti_id',
		'funcionario_func_id',
		'tipoMovimentoCheque_tmc_id',
		'usuario_usua_id'
	];

	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'funcionario_func_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function tipomovimentocheque()
	{
		return $this->belongsTo(Tipomovimentocheque::class, 'tipoMovimentoCheque_tmc_id');
	}

	public function itemrequisicaocheques()
	{
		return $this->hasMany(Itemrequisicaocheque::class, 'requisicaoCheque_rqc_id');
	}
}
