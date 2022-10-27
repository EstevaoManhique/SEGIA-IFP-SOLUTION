<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Categorium
 * 
 * @property int $cate_id
 * @property string|null $cate_descricao
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Categorium extends Model
{
	protected $table = 'categoria';
	protected $primaryKey = 'cate_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'cate_descricao',
		'encrypted',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
