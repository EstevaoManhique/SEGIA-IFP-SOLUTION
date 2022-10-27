<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Modulosusuariomarket
 * 
 * @property int $mui_id
 * @property bool $encrypted
 * @property bool $mui_activos
 * @property bool $mui_bancos
 * @property bool $mui_clientes
 * @property bool $mui_depositos
 * @property bool $mui_despesas
 * @property bool $mui_empresas
 * @property bool $mui_estatisticas
 * @property bool $mui_facturas
 * @property bool $mui_formasPagamento
 * @property bool $mui_fornecedores
 * @property bool $mui_guiasRemessa
 * @property bool $mui_lancamentos
 * @property bool $mui_moedas
 * @property bool $mui_petyCash
 * @property bool $mui_planosDeConta
 * @property bool $mui_produtos
 * @property bool $mui_recursosHumanos
 * @property bool $mui_requisicoes
 * @property bool $mui_requisicoes_add
 * @property bool $mui_requisicoes_aprove
 * @property bool $mui_requisicoes_list
 * @property bool $mui_requisicoes_status
 * @property bool $mui_resultados
 * @property bool $mui_usuarios
 * @property bool $mui_vendas
 * @property int|null $entidade_enti_id
 * @property int|null $usuario_usua_id
 * 
 * @property Usuario|null $usuario
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Modulosusuariomarket extends Model
{
	protected $table = 'modulosusuariomarket';
	protected $primaryKey = 'mui_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'mui_activos' => 'bool',
		'mui_bancos' => 'bool',
		'mui_clientes' => 'bool',
		'mui_depositos' => 'bool',
		'mui_despesas' => 'bool',
		'mui_empresas' => 'bool',
		'mui_estatisticas' => 'bool',
		'mui_facturas' => 'bool',
		'mui_formasPagamento' => 'bool',
		'mui_fornecedores' => 'bool',
		'mui_guiasRemessa' => 'bool',
		'mui_lancamentos' => 'bool',
		'mui_moedas' => 'bool',
		'mui_petyCash' => 'bool',
		'mui_planosDeConta' => 'bool',
		'mui_produtos' => 'bool',
		'mui_recursosHumanos' => 'bool',
		'mui_requisicoes' => 'bool',
		'mui_requisicoes_add' => 'bool',
		'mui_requisicoes_aprove' => 'bool',
		'mui_requisicoes_list' => 'bool',
		'mui_requisicoes_status' => 'bool',
		'mui_resultados' => 'bool',
		'mui_usuarios' => 'bool',
		'mui_vendas' => 'bool',
		'entidade_enti_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'mui_activos',
		'mui_bancos',
		'mui_clientes',
		'mui_depositos',
		'mui_despesas',
		'mui_empresas',
		'mui_estatisticas',
		'mui_facturas',
		'mui_formasPagamento',
		'mui_fornecedores',
		'mui_guiasRemessa',
		'mui_lancamentos',
		'mui_moedas',
		'mui_petyCash',
		'mui_planosDeConta',
		'mui_produtos',
		'mui_recursosHumanos',
		'mui_requisicoes',
		'mui_requisicoes_add',
		'mui_requisicoes_aprove',
		'mui_requisicoes_list',
		'mui_requisicoes_status',
		'mui_resultados',
		'mui_usuarios',
		'mui_vendas',
		'entidade_enti_id',
		'usuario_usua_id'
	];

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
