<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Tipocontum
 * 
 * @property int $tip_id
 * @property bool $encrypted
 * @property string|null $tip_nome
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Contum[] $conta
 *
 * @package App\Models
 */
class Tipocontum extends Model
{
	protected $table = 'tipoconta';
	protected $primaryKey = 'tip_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'tip_nome',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function conta()
	{
		return $this->hasMany(Contum::class, 'tipoConta_tip_id');
	}
}
