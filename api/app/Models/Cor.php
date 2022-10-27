<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Cor
 * 
 * @property int $cor_id
 * @property string|null $cor_codigo
 * @property string|null $cor_codigoHexaDecimal
 * @property string|null $cor_nome
 * @property bool $encrypted
 * 
 * @property Collection|Produto[] $produtos
 *
 * @package App\Models
 */
class Cor extends Model
{
	protected $table = 'cor';
	protected $primaryKey = 'cor_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool'
	];

	protected $fillable = [
		'cor_codigo',
		'cor_codigoHexaDecimal',
		'cor_nome',
		'encrypted'
	];

	public function produtos()
	{
		return $this->hasMany(Produto::class, 'cor_cor_id');
	}
}
