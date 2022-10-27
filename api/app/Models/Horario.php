<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Horario
 * 
 * @property int $hora_id
 * @property bool $encrypted
 * @property string|null $hora_fim
 * @property string|null $hora_inicio
 * @property bool $hora_usado
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Servico[] $servicos
 *
 * @package App\Models
 */
class Horario extends Model
{
	protected $table = 'horario';
	protected $primaryKey = 'hora_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'hora_usado' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'hora_fim',
		'hora_inicio',
		'hora_usado',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function servicos()
	{
		return $this->hasMany(Servico::class, 'horariohora_hora_id');
	}
}
