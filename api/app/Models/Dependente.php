<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Dependente
 * 
 * @property int $dpn_id
 * @property string|null $dpn_grau
 * @property string|null $dpn_nome
 * @property bool $encrypted
 * @property int|null $Entidade_enti_id
 * @property int|null $funcionario_func_id
 * 
 * @property Entidade|null $entidade
 * @property Funcionario|null $funcionario
 *
 * @package App\Models
 */
class Dependente extends Model
{
	protected $table = 'dependente';
	protected $primaryKey = 'dpn_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int',
		'funcionario_func_id' => 'int'
	];

	protected $fillable = [
		'dpn_grau',
		'dpn_nome',
		'encrypted',
		'Entidade_enti_id',
		'funcionario_func_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'funcionario_func_id');
	}
}
