<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Lembrete
 * 
 * @property int $lemb_id
 * @property bool $encrypted
 * @property Carbon|null $lemb_data
 * @property string|null $lemb_descricao
 * @property string|null $lemb_detalhes
 * @property string|null $lemb_referencia
 * @property bool $lemb_sent
 * @property int|null $entidade_enti_id
 * @property int|null $usuario_usua_id
 * 
 * @property Entidade|null $entidade
 * @property Usuario|null $usuario
 *
 * @package App\Models
 */
class Lembrete extends Model
{
	protected $table = 'lembrete';
	protected $primaryKey = 'lemb_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'lemb_sent' => 'bool',
		'entidade_enti_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $dates = [
		'lemb_data'
	];

	protected $fillable = [
		'encrypted',
		'lemb_data',
		'lemb_descricao',
		'lemb_detalhes',
		'lemb_referencia',
		'lemb_sent',
		'entidade_enti_id',
		'usuario_usua_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}
}
