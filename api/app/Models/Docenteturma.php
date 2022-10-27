<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Docenteturma
 * 
 * @property int $doct_id
 * @property int|null $docente_doce_id
 * @property int|null $entidade_enti_id
 * @property int|null $turma_turm_id
 * 
 * @property Docente|null $docente
 * @property Turma|null $turma
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Docenteturma extends Model
{
	protected $table = 'docenteturma';
	protected $primaryKey = 'doct_id';
	public $timestamps = false;

	protected $casts = [
		'docente_doce_id' => 'int',
		'entidade_enti_id' => 'int',
		'turma_turm_id' => 'int'
	];

	protected $fillable = [
		'docente_doce_id',
		'entidade_enti_id',
		'turma_turm_id'
	];

	public function docente()
	{
		return $this->belongsTo(Docente::class, 'docente_doce_id');
	}

	public function turma()
	{
		return $this->belongsTo(Turma::class, 'turma_turm_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
