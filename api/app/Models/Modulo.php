<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Modulo
 * 
 * @property int $modu_id
 * @property bool $encrypted
 * @property float $modu_credito
 * @property string|null $modu_descricao
 * @property int $modu_durcao
 * @property float $modu_preco
 * @property int|null $curso_curs_id
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Curso|null $curso
 *
 * @package App\Models
 */
class Modulo extends Model
{
	protected $table = 'modulo';
	protected $primaryKey = 'modu_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'modu_credito' => 'float',
		'modu_durcao' => 'int',
		'modu_preco' => 'float',
		'curso_curs_id' => 'int',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'modu_credito',
		'modu_descricao',
		'modu_durcao',
		'modu_preco',
		'curso_curs_id',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function curso()
	{
		return $this->belongsTo(Curso::class, 'curso_curs_id');
	}
}
