<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Categoriaproduto
 * 
 * @property int $catp_id
 * @property string|null $catp_codigo
 * @property string|null $catp_descricao
 * @property bool $catp_estocado
 * @property int $catp_numeroArtigos
 * @property int $catp_referenciaArtigos
 * @property bool $encrypted
 * @property int|null $Entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Produto[] $produtos
 *
 * @package App\Models
 */
class Categoriaproduto extends Model
{
	protected $table = 'categoriaproduto';
	protected $primaryKey = 'catp_id';
	public $timestamps = false;

	protected $casts = [
		'catp_estocado' => 'bool',
		'catp_numeroArtigos' => 'int',
		'catp_referenciaArtigos' => 'int',
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'catp_codigo',
		'catp_descricao',
		'catp_estocado',
		'catp_numeroArtigos',
		'catp_referenciaArtigos',
		'encrypted',
		'Entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function produtos()
	{
		return $this->hasMany(Produto::class, 'categoriaProduto_catp_id');
	}
}
