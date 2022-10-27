<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Convocado
 * 
 * @property int $convo_id
 * @property int|null $convocatoria_conv_id
 * @property int|null $entidade_enti_id
 * @property int|null $escola_esc_id
 * @property int|null $pessoa_pess_id
 * 
 * @property Entidade|null $entidade
 * @property Escola|null $escola
 * @property Pessoa|null $pessoa
 * @property Convocatorium|null $convocatorium
 *
 * @package App\Models
 */
class Convocado extends Model
{
	protected $table = 'convocado';
	protected $primaryKey = 'convo_id';
	public $timestamps = false;

	protected $casts = [
		'convocatoria_conv_id' => 'int',
		'entidade_enti_id' => 'int',
		'escola_esc_id' => 'int',
		'pessoa_pess_id' => 'int'
	];

	protected $fillable = [
		'convocatoria_conv_id',
		'entidade_enti_id',
		'escola_esc_id',
		'pessoa_pess_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function escola()
	{
		return $this->belongsTo(Escola::class, 'escola_esc_id');
	}

	public function pessoa()
	{
		return $this->belongsTo(Pessoa::class, 'pessoa_pess_id');
	}

	public function convocatorium()
	{
		return $this->belongsTo(Convocatorium::class, 'convocatoria_conv_id');
	}
}
