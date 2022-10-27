<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Mensalidade
 * 
 * @property int $mens_id
 * @property bool $encrypted
 * @property Carbon|null $mens_dataInscricao
 * @property Carbon|null $mens_dataPagamento
 * @property Carbon|null $mens_dataProximoPagamento
 * @property string|null $mens_estado
 * @property int|null $aluno_alun_id
 * @property int|null $curso_curs_id
 * @property int|null $entidade_enti_id
 * 
 * @property Aluno|null $aluno
 * @property Entidade|null $entidade
 * @property Curso|null $curso
 *
 * @package App\Models
 */
class Mensalidade extends Model
{
	protected $table = 'mensalidade';
	protected $primaryKey = 'mens_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'aluno_alun_id' => 'int',
		'curso_curs_id' => 'int',
		'entidade_enti_id' => 'int'
	];

	protected $dates = [
		'mens_dataInscricao',
		'mens_dataPagamento',
		'mens_dataProximoPagamento'
	];

	protected $fillable = [
		'encrypted',
		'mens_dataInscricao',
		'mens_dataPagamento',
		'mens_dataProximoPagamento',
		'mens_estado',
		'aluno_alun_id',
		'curso_curs_id',
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

	public function curso()
	{
		return $this->belongsTo(Curso::class, 'curso_curs_id');
	}
}
