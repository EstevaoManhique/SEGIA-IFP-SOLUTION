<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Area
 * 
 * @property int $area_id
 * @property string|null $area_descricao
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Area extends Model
{
	protected $table = 'area';
	protected $primaryKey = 'area_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'area_descricao',
		'encrypted',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
