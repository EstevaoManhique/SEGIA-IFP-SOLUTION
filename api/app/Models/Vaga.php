<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Vaga
 * 
 * @property int $vaga_id
 * @property bool $encrypted
 * @property int $vaga_preechidas
 * @property int $vaga_total
 * @property int|null $anoLectivo_anol_id
 * @property int|null $curso_curs_id
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Anolectivo|null $anolectivo
 * @property Curso|null $curso
 *
 * @package App\Models
 */
class Vaga extends Model
{
	protected $table = 'vagas';
	protected $primaryKey = 'vaga_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'vaga_preechidas' => 'int',
		'vaga_total' => 'int',
		'anoLectivo_anol_id' => 'int',
		'curso_curs_id' => 'int',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'vaga_preechidas',
		'vaga_total',
		'anoLectivo_anol_id',
		'curso_curs_id',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function anolectivo()
	{
		return $this->belongsTo(Anolectivo::class, 'anoLectivo_anol_id');
	}

	public function curso()
	{
		return $this->belongsTo(Curso::class, 'curso_curs_id');
	}
}
