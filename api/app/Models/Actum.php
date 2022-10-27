<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Actum
 * 
 * @property int $acta_id
 * @property Carbon|null $acta_data
 * @property string|null $acta_descricao
 * @property string|null $acta_referencia
 * @property int|null $convocatoria_conv_id
 * @property int|null $entidade_enti_id
 * @property int|null $escola_esc_id
 * 
 * @property Escola|null $escola
 * @property Convocatorium|null $convocatorium
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Actum extends Model
{
	protected $table = 'acta';
	protected $primaryKey = 'acta_id';
	public $timestamps = false;

	protected $casts = [
		'convocatoria_conv_id' => 'int',
		'entidade_enti_id' => 'int',
		'escola_esc_id' => 'int'
	];

	protected $dates = [
		'acta_data'
	];

	protected $fillable = [
		'acta_data',
		'acta_descricao',
		'acta_referencia',
		'convocatoria_conv_id',
		'entidade_enti_id',
		'escola_esc_id'
	];

	public function escola()
	{
		return $this->belongsTo(Escola::class, 'escola_esc_id');
	}

	public function convocatorium()
	{
		return $this->belongsTo(Convocatorium::class, 'convocatoria_conv_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
