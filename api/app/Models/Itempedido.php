<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Itempedido
 * 
 * @property int $itp_id
 * @property bool $encrypted
 * @property string|null $itp_cod
 * @property float $itp_custoVenda
 * @property Carbon|null $itp_data
 * @property float $itp_desconto
 * @property string|null $itp_descricao
 * @property float $itp_iva
 * @property float $itp_precoIva
 * @property float $itp_precoIvaMedio
 * @property float $itp_precoMedio
 * @property float $itp_precoTotal
 * @property float $itp_precoTotalMedio
 * @property float $itp_precoUnit
 * @property int $itp_quantidade
 * @property int $itp_refProduto
 * @property string|null $itp_referencia
 * @property int $itp_referenciaFactura
 * @property string|null $itp_referenciaGuia
 * @property string|null $itp_tipoVenda
 * @property int|null $entidade_enti_id
 * @property int|null $factura_fact_id
 * @property int|null $guiaRemessa_guia_id
 * 
 * @property Guiaremessa|null $guiaremessa
 * @property Factura|null $factura
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Itempedido extends Model
{
	protected $table = 'itempedido';
	protected $primaryKey = 'itp_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'itp_custoVenda' => 'float',
		'itp_desconto' => 'float',
		'itp_iva' => 'float',
		'itp_precoIva' => 'float',
		'itp_precoIvaMedio' => 'float',
		'itp_precoMedio' => 'float',
		'itp_precoTotal' => 'float',
		'itp_precoTotalMedio' => 'float',
		'itp_precoUnit' => 'float',
		'itp_quantidade' => 'int',
		'itp_refProduto' => 'int',
		'itp_referenciaFactura' => 'int',
		'entidade_enti_id' => 'int',
		'factura_fact_id' => 'int',
		'guiaRemessa_guia_id' => 'int'
	];

	protected $dates = [
		'itp_data'
	];

	protected $fillable = [
		'encrypted',
		'itp_cod',
		'itp_custoVenda',
		'itp_data',
		'itp_desconto',
		'itp_descricao',
		'itp_iva',
		'itp_precoIva',
		'itp_precoIvaMedio',
		'itp_precoMedio',
		'itp_precoTotal',
		'itp_precoTotalMedio',
		'itp_precoUnit',
		'itp_quantidade',
		'itp_refProduto',
		'itp_referencia',
		'itp_referenciaFactura',
		'itp_referenciaGuia',
		'itp_tipoVenda',
		'entidade_enti_id',
		'factura_fact_id',
		'guiaRemessa_guia_id'
	];

	public function guiaremessa()
	{
		return $this->belongsTo(Guiaremessa::class, 'guiaRemessa_guia_id');
	}

	public function factura()
	{
		return $this->belongsTo(Factura::class, 'factura_fact_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
