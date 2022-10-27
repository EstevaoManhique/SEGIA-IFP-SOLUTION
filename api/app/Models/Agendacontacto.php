<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Agendacontacto
 * 
 * @property int $agc_id
 * @property string|null $agc_descricao
 * @property bool $encrypted
 * @property int|null $cliente_clie_id
 * @property int|null $entidade_enti_id
 * @property int|null $fornecedor_for_id
 * @property int|null $funcionario_func_id
 * @property int|null $tipoContacto_tipc_id
 * 
 * @property Cliente|null $cliente
 * @property Funcionario|null $funcionario
 * @property Entidade|null $entidade
 * @property Fornecedor|null $fornecedor
 * @property Tipocontacto|null $tipocontacto
 *
 * @package App\Models
 */
class Agendacontacto extends Model
{
	protected $table = 'agendacontacto';
	protected $primaryKey = 'agc_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'cliente_clie_id' => 'int',
		'entidade_enti_id' => 'int',
		'fornecedor_for_id' => 'int',
		'funcionario_func_id' => 'int',
		'tipoContacto_tipc_id' => 'int'
	];

	protected $fillable = [
		'agc_descricao',
		'encrypted',
		'cliente_clie_id',
		'entidade_enti_id',
		'fornecedor_for_id',
		'funcionario_func_id',
		'tipoContacto_tipc_id'
	];

	public function cliente()
	{
		return $this->belongsTo(Cliente::class, 'cliente_clie_id');
	}

	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'funcionario_func_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function fornecedor()
	{
		return $this->belongsTo(Fornecedor::class, 'fornecedor_for_id');
	}

	public function tipocontacto()
	{
		return $this->belongsTo(Tipocontacto::class, 'tipoContacto_tipc_id');
	}
}
