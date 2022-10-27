<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Venda
 * 
 * @property int $vend_id
 * @property bool $encrypted
 * @property Carbon|null $vend_dataVenda
 * @property string|null $vend_descricao
 * @property string|null $vend_estado
 * @property string|null $vend_referencia
 * @property int|null $Entidade_enti_id
 * @property int|null $cliente_clie_id
 * 
 * @property Entidade|null $entidade
 * @property Cliente|null $cliente
 * @property Collection|Factura[] $facturas
 *
 * @package App\Models
 */
class Venda extends Model
{
	protected $table = 'venda';
	protected $primaryKey = 'vend_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int',
		'cliente_clie_id' => 'int'
	];

	protected $dates = [
		'vend_dataVenda'
	];

	protected $fillable = [
		'encrypted',
		'vend_dataVenda',
		'vend_descricao',
		'vend_estado',
		'vend_referencia',
		'Entidade_enti_id',
		'cliente_clie_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function cliente()
	{
		return $this->belongsTo(Cliente::class, 'cliente_clie_id');
	}

	public function facturas()
	{
		return $this->hasMany(Factura::class, 'venda_vend_id');
	}
}
