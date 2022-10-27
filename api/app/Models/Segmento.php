<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Segmento
 * 
 * @property int $seg_id
 * @property bool $encrypted
 * @property string|null $seg_categoria
 * @property string|null $seg_descricao
 * @property int $seg_numero
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Segmento extends Model
{
	protected $table = 'segmento';
	protected $primaryKey = 'seg_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'seg_numero' => 'int',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'seg_categoria',
		'seg_descricao',
		'seg_numero',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
