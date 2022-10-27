<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Tamanho
 * 
 * @property int $tam_id
 * @property bool $encrypted
 * @property string|null $tam_descricao
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Produto[] $produtos
 *
 * @package App\Models
 */
class Tamanho extends Model
{
	protected $table = 'tamanho';
	protected $primaryKey = 'tam_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'tam_descricao',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function produtos()
	{
		return $this->hasMany(Produto::class, 'tamanho_tam_id');
	}
}
