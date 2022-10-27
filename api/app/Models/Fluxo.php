<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Fluxo
 * 
 * @property int $flux_id
 * @property bool $encrypted
 * @property float $flux_custoVenda
 * @property Carbon|null $flux_data
 * @property string|null $flux_descricao
 * @property int $flux_qtd
 * @property int $flux_qtdPresente
 * @property string|null $flux_referenciaDocumento
 * @property string|null $flux_tipo
 * @property string|null $flux_tipoVenda
 * @property int $flux_ultimoStock
 * @property int|null $cliente_clie_id
 * @property int|null $entidade_enti_id
 * @property int|null $factura_fact_id
 * @property int|null $produto_pro_id
 * @property int|null $turma_turm_id
 * @property int|null $usuario_usua_id
 * 
 * @property Cliente|null $cliente
 * @property Entidade|null $entidade
 * @property Usuario|null $usuario
 * @property Produto|null $produto
 * @property Factura|null $factura
 * @property Turma|null $turma
 *
 * @package App\Models
 */
class Fluxo extends Model
{
	protected $table = 'fluxo';
	protected $primaryKey = 'flux_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'flux_custoVenda' => 'float',
		'flux_qtd' => 'int',
		'flux_qtdPresente' => 'int',
		'flux_ultimoStock' => 'int',
		'cliente_clie_id' => 'int',
		'entidade_enti_id' => 'int',
		'factura_fact_id' => 'int',
		'produto_pro_id' => 'int',
		'turma_turm_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $dates = [
		'flux_data'
	];

	protected $fillable = [
		'encrypted',
		'flux_custoVenda',
		'flux_data',
		'flux_descricao',
		'flux_qtd',
		'flux_qtdPresente',
		'flux_referenciaDocumento',
		'flux_tipo',
		'flux_tipoVenda',
		'flux_ultimoStock',
		'cliente_clie_id',
		'entidade_enti_id',
		'factura_fact_id',
		'produto_pro_id',
		'turma_turm_id',
		'usuario_usua_id'
	];

	public function cliente()
	{
		return $this->belongsTo(Cliente::class, 'cliente_clie_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function produto()
	{
		return $this->belongsTo(Produto::class, 'produto_pro_id');
	}

	public function factura()
	{
		return $this->belongsTo(Factura::class, 'factura_fact_id');
	}

	public function turma()
	{
		return $this->belongsTo(Turma::class, 'turma_turm_id');
	}
}
