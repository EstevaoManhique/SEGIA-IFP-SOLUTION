<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Avaliacao
 * 
 * @property int $aval_id
 * @property int $aval_anoLectivo
 * @property string|null $aval_comportamento
 * @property string|null $aval_observacoes
 * @property string|null $aval_semestre
 * @property bool $encrypted
 * @property int|null $aluno_alun_id
 * @property int|null $entidade_enti_id
 * 
 * @property Aluno|null $aluno
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Avaliacao extends Model
{
	protected $table = 'avaliacao';
	protected $primaryKey = 'aval_id';
	public $timestamps = false;

	protected $casts = [
		'aval_anoLectivo' => 'int',
		'encrypted' => 'bool',
		'aluno_alun_id' => 'int',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'aval_anoLectivo',
		'aval_comportamento',
		'aval_observacoes',
		'aval_semestre',
		'encrypted',
		'aluno_alun_id',
		'entidade_enti_id'
	];

	public function aluno()
	{
		return $this->belongsTo(Aluno::class, 'aluno_alun_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
