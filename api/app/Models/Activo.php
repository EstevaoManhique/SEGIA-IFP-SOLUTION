<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Activo
 * 
 * @property int $acti_id
 * @property Carbon|null $acti_data
 * @property string|null $acti_descricao
 * @property string|null $acti_especificacoes
 * @property string|null $acti_referenciaDocumentoCompra
 * @property float $acti_valor
 * @property int $acti_vidaUtil
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * @property int|null $fornecedor_for_id
 * 
 * @property Fornecedor|null $fornecedor
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Activo extends Model
{
	protected $table = 'activo';
	protected $primaryKey = 'acti_id';
	public $timestamps = false;

	protected $casts = [
		'acti_valor' => 'float',
		'acti_vidaUtil' => 'int',
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int',
		'fornecedor_for_id' => 'int'
	];

	protected $dates = [
		'acti_data'
	];

	protected $fillable = [
		'acti_data',
		'acti_descricao',
		'acti_especificacoes',
		'acti_referenciaDocumentoCompra',
		'acti_valor',
		'acti_vidaUtil',
		'encrypted',
		'entidade_enti_id',
		'fornecedor_for_id'
	];

	public function fornecedor()
	{
		return $this->belongsTo(Fornecedor::class, 'fornecedor_for_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
