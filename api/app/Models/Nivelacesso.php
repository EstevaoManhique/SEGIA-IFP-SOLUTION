<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Nivelacesso
 * 
 * @property int $niva_id
 * @property bool $encrypted
 * @property string|null $niva_descricao
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Tipousuario[] $tipousuarios
 *
 * @package App\Models
 */
class Nivelacesso extends Model
{
	protected $table = 'nivelacesso';
	protected $primaryKey = 'niva_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'niva_descricao',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function tipousuarios()
	{
		return $this->hasMany(Tipousuario::class, 'nivelAcessoniva_niva_id');
	}
}
