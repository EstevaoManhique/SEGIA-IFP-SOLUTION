<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Tipocontacto
 * 
 * @property int $tipc_id
 * @property bool $encrypted
 * @property string|null $tipc_nome
 * 
 * @property Collection|Agendacontacto[] $agendacontactos
 *
 * @package App\Models
 */
class Tipocontacto extends Model
{
	protected $table = 'tipocontacto';
	protected $primaryKey = 'tipc_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool'
	];

	protected $fillable = [
		'encrypted',
		'tipc_nome'
	];

	public function agendacontactos()
	{
		return $this->hasMany(Agendacontacto::class, 'tipoContacto_tipc_id');
	}
}
