<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Requisicao
 * 
 * @property int $req_id
 * @property bool $encrypted
 * @property Carbon|null $req_data
 * @property string|null $req_serie
 * @property int|null $entidade_enti_id
 * @property int|null $funcionario_func_id
 * 
 * @property Entidade|null $entidade
 * @property Funcionario|null $funcionario
 * @property Collection|Itemrequisicao[] $itemrequisicaos
 *
 * @package App\Models
 */
class Requisicao extends Model
{
	protected $table = 'requisicao';
	protected $primaryKey = 'req_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int',
		'funcionario_func_id' => 'int'
	];

	protected $dates = [
		'req_data'
	];

	protected $fillable = [
		'encrypted',
		'req_data',
		'req_serie',
		'entidade_enti_id',
		'funcionario_func_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'funcionario_func_id');
	}

	public function itemrequisicaos()
	{
		return $this->hasMany(Itemrequisicao::class, 'requisicao_req_id');
	}
}
