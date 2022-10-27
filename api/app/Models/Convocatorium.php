<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Convocatorium
 * 
 * @property int $conv_id
 * @property string|null $conv_1
 * @property string|null $conv_10
 * @property string|null $conv_2
 * @property string|null $conv_3
 * @property string|null $conv_4
 * @property string|null $conv_5
 * @property string|null $conv_6
 * @property string|null $conv_7
 * @property string|null $conv_8
 * @property string|null $conv_9
 * @property bool $conv_acta
 * @property Carbon|null $conv_data
 * @property Carbon|null $conv_dataReuniao
 * @property int|null $entidade_enti_id
 * @property int|null $escola_esc_id
 * @property int|null $presidente_pess_id
 * @property int|null $sala_sala_id
 * @property int|null $secretario_pess_id
 * 
 * @property Escola|null $escola
 * @property Pessoa|null $pessoa
 * @property Entidade|null $entidade
 * @property Sala|null $sala
 * @property Collection|Actum[] $acta
 * @property Collection|Convocado[] $convocados
 *
 * @package App\Models
 */
class Convocatorium extends Model
{
	protected $table = 'convocatoria';
	protected $primaryKey = 'conv_id';
	public $timestamps = false;

	protected $casts = [
		'conv_acta' => 'bool',
		'entidade_enti_id' => 'int',
		'escola_esc_id' => 'int',
		'presidente_pess_id' => 'int',
		'sala_sala_id' => 'int',
		'secretario_pess_id' => 'int'
	];

	protected $dates = [
		'conv_data',
		'conv_dataReuniao'
	];

	protected $hidden = [
		'secretario_pess_id'
	];

	protected $fillable = [
		'conv_1',
		'conv_10',
		'conv_2',
		'conv_3',
		'conv_4',
		'conv_5',
		'conv_6',
		'conv_7',
		'conv_8',
		'conv_9',
		'conv_acta',
		'conv_data',
		'conv_dataReuniao',
		'entidade_enti_id',
		'escola_esc_id',
		'presidente_pess_id',
		'sala_sala_id',
		'secretario_pess_id'
	];

	public function escola()
	{
		return $this->belongsTo(Escola::class, 'escola_esc_id');
	}

	public function pessoa()
	{
		return $this->belongsTo(Pessoa::class, 'secretario_pess_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function sala()
	{
		return $this->belongsTo(Sala::class, 'sala_sala_id');
	}

	public function acta()
	{
		return $this->hasMany(Actum::class, 'convocatoria_conv_id');
	}

	public function convocados()
	{
		return $this->hasMany(Convocado::class, 'convocatoria_conv_id');
	}
}
