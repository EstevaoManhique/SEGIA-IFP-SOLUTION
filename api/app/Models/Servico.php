<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Servico
 * 
 * @property int $serv_id
 * @property bool $encrypted
 * @property string|null $serv_descricao
 * @property string|null $serv_informacoes
 * @property float $serv_valor
 * @property int|null $entidade_enti_id
 * @property int|null $horariohora_hora_id
 * 
 * @property Entidade|null $entidade
 * @property Horario|null $horario
 * @property Collection|Contracto[] $contractos
 * @property Collection|Servicovendido[] $servicovendidos
 *
 * @package App\Models
 */
class Servico extends Model
{
	protected $table = 'servico';
	protected $primaryKey = 'serv_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'serv_valor' => 'float',
		'entidade_enti_id' => 'int',
		'horariohora_hora_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'serv_descricao',
		'serv_informacoes',
		'serv_valor',
		'entidade_enti_id',
		'horariohora_hora_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function horario()
	{
		return $this->belongsTo(Horario::class, 'horariohora_hora_id');
	}

	public function contractos()
	{
		return $this->hasMany(Contracto::class, 'servicoserv_serv_id');
	}

	public function servicovendidos()
	{
		return $this->hasMany(Servicovendido::class, 'servico_serv_id');
	}
}
