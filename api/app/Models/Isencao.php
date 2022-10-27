<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Isencao
 * 
 * @property int $isen_id
 * @property bool $encrypted
 * @property string|null $isen_codigo
 * @property string|null $isen_descricao
 * @property string|null $isen_detalhes
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Isencao extends Model
{
	protected $table = 'isencao';
	protected $primaryKey = 'isen_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'isen_codigo',
		'isen_descricao',
		'isen_detalhes',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
