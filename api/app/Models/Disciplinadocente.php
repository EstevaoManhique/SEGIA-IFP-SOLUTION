<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Disciplinadocente
 * 
 * @property int $disd_id
 * @property int|null $disciplina_disc_id
 * @property int|null $docente_doce_id
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Docente|null $docente
 * @property Disciplina|null $disciplina
 *
 * @package App\Models
 */
class Disciplinadocente extends Model
{
	protected $table = 'disciplinadocente';
	protected $primaryKey = 'disd_id';
	public $timestamps = false;

	protected $casts = [
		'disciplina_disc_id' => 'int',
		'docente_doce_id' => 'int',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'disciplina_disc_id',
		'docente_doce_id',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function docente()
	{
		return $this->belongsTo(Docente::class, 'docente_doce_id');
	}

	public function disciplina()
	{
		return $this->belongsTo(Disciplina::class, 'disciplina_disc_id');
	}
}
