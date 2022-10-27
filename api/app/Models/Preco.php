<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Preco
 * 
 * @property int $pre_id
 * @property float $pre_valor
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Preco extends Model
{
	protected $table = 'preco';
	protected $primaryKey = 'pre_id';
	public $timestamps = false;

	protected $casts = [
		'pre_valor' => 'float',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'pre_valor',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
