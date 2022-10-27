<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Disciplinacurso
 * 
 * @property int $disd_id
 * @property string|null $disd_semestre
 * @property bool $encrypted
 * @property int|null $curso_curs_id
 * @property int|null $disciplina_disc_id
 * @property int|null $entidade_enti_id
 * 
 * @property Curso|null $curso
 * @property Disciplina|null $disciplina
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Disciplinacurso extends Model
{
	protected $table = 'disciplinacurso';
	protected $primaryKey = 'disd_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'curso_curs_id' => 'int',
		'disciplina_disc_id' => 'int',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'disd_semestre',
		'encrypted',
		'curso_curs_id',
		'disciplina_disc_id',
		'entidade_enti_id'
	];

	public function curso()
	{
		return $this->belongsTo(Curso::class, 'curso_curs_id');
	}

	public function disciplina()
	{
		return $this->belongsTo(Disciplina::class, 'disciplina_disc_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
