<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Produtovendido
 * 
 * @property int $prv_id
 * @property float $prv_ajuste
 * @property float $prv_custoVenda
 * @property Carbon|null $prv_data
 * @property float $prv_desconto
 * @property string|null $prv_descricao
 * @property float $prv_iva
 * @property float $prv_precoCusto
 * @property float $prv_precoMedio
 * @property int $prv_qtd
 * @property string|null $prv_referencia
 * @property string|null $prv_tipoVenda
 * @property float $prv_total
 * @property float $prv_totalIva
 * @property float $prv_totalIvaMedio
 * @property float $prv_totalPrecoMedio
 * @property int|null $Entidade_enti_id
 * @property int|null $factura_fact_id
 * @property int|null $produto_pro_id
 * 
 * @property Entidade|null $entidade
 * @property Produto|null $produto
 * @property Factura|null $factura
 *
 * @package App\Models
 */
class Produtovendido extends Model
{
	protected $table = 'produtovendido';
	protected $primaryKey = 'prv_id';
	public $timestamps = false;

	protected $casts = [
		'prv_ajuste' => 'float',
		'prv_custoVenda' => 'float',
		'prv_desconto' => 'float',
		'prv_iva' => 'float',
		'prv_precoCusto' => 'float',
		'prv_precoMedio' => 'float',
		'prv_qtd' => 'int',
		'prv_total' => 'float',
		'prv_totalIva' => 'float',
		'prv_totalIvaMedio' => 'float',
		'prv_totalPrecoMedio' => 'float',
		'Entidade_enti_id' => 'int',
		'factura_fact_id' => 'int',
		'produto_pro_id' => 'int'
	];

	protected $dates = [
		'prv_data'
	];

	protected $fillable = [
		'prv_ajuste',
		'prv_custoVenda',
		'prv_data',
		'prv_desconto',
		'prv_descricao',
		'prv_iva',
		'prv_precoCusto',
		'prv_precoMedio',
		'prv_qtd',
		'prv_referencia',
		'prv_tipoVenda',
		'prv_total',
		'prv_totalIva',
		'prv_totalIvaMedio',
		'prv_totalPrecoMedio',
		'Entidade_enti_id',
		'factura_fact_id',
		'produto_pro_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function produto()
	{
		return $this->belongsTo(Produto::class, 'produto_pro_id');
	}

	public function factura()
	{
		return $this->belongsTo(Factura::class, 'factura_fact_id');
	}
}
