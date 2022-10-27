<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Itemrequisicao
 * 
 * @property int $itr_id
 * @property bool $encrypted
 * @property string|null $itr_descricao
 * @property int $itr_qtd
 * @property float $itr_valor
 * @property int|null $entidade_enti_id
 * @property int|null $requisicao_req_id
 * 
 * @property Entidade|null $entidade
 * @property Requisicao|null $requisicao
 *
 * @package App\Models
 */
class Itemrequisicao extends Model
{
	protected $table = 'itemrequisicao';
	protected $primaryKey = 'itr_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'itr_qtd' => 'int',
		'itr_valor' => 'float',
		'entidade_enti_id' => 'int',
		'requisicao_req_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'itr_descricao',
		'itr_qtd',
		'itr_valor',
		'entidade_enti_id',
		'requisicao_req_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function requisicao()
	{
		return $this->belongsTo(Requisicao::class, 'requisicao_req_id');
	}
}
