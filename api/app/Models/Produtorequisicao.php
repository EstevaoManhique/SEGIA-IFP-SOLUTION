<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Produtorequisicao
 * 
 * @property int $prr_id
 * @property Carbon|null $prr_data
 * @property int $prr_qtd
 * @property string|null $prr_referencia
 * @property int|null $Entidade_enti_id
 * @property int|null $produto_pro_id
 * @property int|null $requisicaoMaterial_reqm_id
 * 
 * @property Entidade|null $entidade
 * @property Requisicaomaterial|null $requisicaomaterial
 * @property Produto|null $produto
 *
 * @package App\Models
 */
class Produtorequisicao extends Model
{
	protected $table = 'produtorequisicao';
	protected $primaryKey = 'prr_id';
	public $timestamps = false;

	protected $casts = [
		'prr_qtd' => 'int',
		'Entidade_enti_id' => 'int',
		'produto_pro_id' => 'int',
		'requisicaoMaterial_reqm_id' => 'int'
	];

	protected $dates = [
		'prr_data'
	];

	protected $fillable = [
		'prr_data',
		'prr_qtd',
		'prr_referencia',
		'Entidade_enti_id',
		'produto_pro_id',
		'requisicaoMaterial_reqm_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function requisicaomaterial()
	{
		return $this->belongsTo(Requisicaomaterial::class, 'requisicaoMaterial_reqm_id');
	}

	public function produto()
	{
		return $this->belongsTo(Produto::class, 'produto_pro_id');
	}
}
