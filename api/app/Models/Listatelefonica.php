<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Listatelefonica
 * 
 * @property int $lst_id
 * @property bool $encrypted
 * @property string|null $lst_categoria
 * @property string|null $lst_nome
 * @property string|null $lst_telefone
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Listatelefonica extends Model
{
	protected $table = 'listatelefonica';
	protected $primaryKey = 'lst_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'lst_categoria',
		'lst_nome',
		'lst_telefone',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
