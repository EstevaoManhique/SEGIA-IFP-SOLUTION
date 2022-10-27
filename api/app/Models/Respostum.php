<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Respostum
 * 
 * @property int $resp_id
 * @property bool $encrypted
 * @property string|null $resp_categoria
 * @property string|null $resp_opcao1
 * @property string|null $resp_opcao2
 * @property string|null $resp_opcao3
 * @property string|null $resp_opcao4
 * @property string|null $resp_pergunta
 * @property float $resp_pontuacao
 * @property string|null $resp_resposta
 * @property int|null $anoLectivo_anol_id
 * @property int|null $curso_curs_id
 * @property int|null $disciplina_disc_id
 * @property int|null $entidade_enti_id
 * 
 * @property Curso|null $curso
 * @property Anolectivo|null $anolectivo
 * @property Entidade|null $entidade
 * @property Disciplina|null $disciplina
 *
 * @package App\Models
 */
class Respostum extends Model
{
	protected $table = 'resposta';
	protected $primaryKey = 'resp_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'resp_pontuacao' => 'float',
		'anoLectivo_anol_id' => 'int',
		'curso_curs_id' => 'int',
		'disciplina_disc_id' => 'int',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'resp_categoria',
		'resp_opcao1',
		'resp_opcao2',
		'resp_opcao3',
		'resp_opcao4',
		'resp_pergunta',
		'resp_pontuacao',
		'resp_resposta',
		'anoLectivo_anol_id',
		'curso_curs_id',
		'disciplina_disc_id',
		'entidade_enti_id'
	];

	public function curso()
	{
		return $this->belongsTo(Curso::class, 'curso_curs_id');
	}

	public function anolectivo()
	{
		return $this->belongsTo(Anolectivo::class, 'anoLectivo_anol_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function disciplina()
	{
		return $this->belongsTo(Disciplina::class, 'disciplina_disc_id');
	}
}
