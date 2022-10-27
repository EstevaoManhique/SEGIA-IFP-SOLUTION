<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Contacorrente
 * 
 * @property int $coco_id
 * @property float $coco_credito
 * @property Carbon|null $coco_data
 * @property float $coco_debito
 * @property string|null $coco_documento
 * @property float $coco_saldo
 * @property bool $encrypted
 * @property int|null $cliente_clie_id
 * @property int|null $entidade_enti_id
 * @property int|null $usuario_usua_id
 * 
 * @property Cliente|null $cliente
 * @property Usuario|null $usuario
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Contacorrente extends Model
{
	protected $table = 'contacorrente';
	protected $primaryKey = 'coco_id';
	public $timestamps = false;

	protected $casts = [
		'coco_credito' => 'float',
		'coco_debito' => 'float',
		'coco_saldo' => 'float',
		'encrypted' => 'bool',
		'cliente_clie_id' => 'int',
		'entidade_enti_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $dates = [
		'coco_data'
	];

	protected $fillable = [
		'coco_credito',
		'coco_data',
		'coco_debito',
		'coco_documento',
		'coco_saldo',
		'encrypted',
		'cliente_clie_id',
		'entidade_enti_id',
		'usuario_usua_id'
	];

	public function cliente()
	{
		return $this->belongsTo(Cliente::class, 'cliente_clie_id');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
