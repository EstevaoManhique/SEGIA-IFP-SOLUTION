<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Guiaremessa
 * 
 * @property int $guia_id
 * @property bool $encrypted
 * @property Carbon|null $guia_data
 * @property Carbon|null $guia_dataAprovacao
 * @property string|null $guia_designado
 * @property string|null $guia_detalhes
 * @property string|null $guia_documento
 * @property int $guia_numeroLancamento
 * @property string|null $guia_referencia
 * @property string|null $guia_status
 * @property string|null $guia_tipo
 * @property int|null $cliente_clie_id
 * @property int|null $entidade_enti_id
 * @property int|null $factura_fact_id
 * @property int|null $fornecedor_for_id
 * @property int|null $usuario_usua_id
 * @property int|null $usuario2_usua_id
 * 
 * @property Cliente|null $cliente
 * @property Usuario|null $usuario
 * @property Fornecedor|null $fornecedor
 * @property Factura|null $factura
 * @property Entidade|null $entidade
 * @property Collection|Itempedido[] $itempedidos
 *
 * @package App\Models
 */
class Guiaremessa extends Model
{
	protected $table = 'guiaremessa';
	protected $primaryKey = 'guia_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'guia_numeroLancamento' => 'int',
		'cliente_clie_id' => 'int',
		'entidade_enti_id' => 'int',
		'factura_fact_id' => 'int',
		'fornecedor_for_id' => 'int',
		'usuario_usua_id' => 'int',
		'usuario2_usua_id' => 'int'
	];

	protected $dates = [
		'guia_data',
		'guia_dataAprovacao'
	];

	protected $fillable = [
		'encrypted',
		'guia_data',
		'guia_dataAprovacao',
		'guia_designado',
		'guia_detalhes',
		'guia_documento',
		'guia_numeroLancamento',
		'guia_referencia',
		'guia_status',
		'guia_tipo',
		'cliente_clie_id',
		'entidade_enti_id',
		'factura_fact_id',
		'fornecedor_for_id',
		'usuario_usua_id',
		'usuario2_usua_id'
	];

	public function cliente()
	{
		return $this->belongsTo(Cliente::class, 'cliente_clie_id');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function fornecedor()
	{
		return $this->belongsTo(Fornecedor::class, 'fornecedor_for_id');
	}

	public function factura()
	{
		return $this->belongsTo(Factura::class, 'factura_fact_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function itempedidos()
	{
		return $this->hasMany(Itempedido::class, 'guiaRemessa_guia_id');
	}
}
