<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Trial
 * 
 * @property int $tria_id
 * @property Carbon|null $tria_fimTrial
 * @property Carbon|null $tria_inicioTrial
 * @property int|null $entidade_enti_id
 * @property int|null $sistema_sist_id
 * 
 * @property Entidade|null $entidade
 * @property Sistema|null $sistema
 *
 * @package App\Models
 */
class Trial extends Model
{
	protected $table = 'trial';
	protected $primaryKey = 'tria_id';
	public $timestamps = false;

	protected $casts = [
		'entidade_enti_id' => 'int',
		'sistema_sist_id' => 'int'
	];

	protected $dates = [
		'tria_fimTrial',
		'tria_inicioTrial'
	];

	protected $fillable = [
		'tria_fimTrial',
		'tria_inicioTrial',
		'entidade_enti_id',
		'sistema_sist_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function sistema()
	{
		return $this->belongsTo(Sistema::class, 'sistema_sist_id');
	}
}
