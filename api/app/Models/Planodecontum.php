<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Planodecontum
 * 
 * @property int $pdc_id
 * @property bool $encrypted
 * @property string|null $pdc_codigo
 * @property string|null $pdc_descricao
 * @property int|null $entidade_enti_id
 * @property int|null $planoDeConta_pdc_id
 * 
 * @property Planodecontum|null $planodecontum
 * @property Entidade|null $entidade
 * @property Collection|Planodecontum[] $planodeconta
 *
 * @package App\Models
 */
class Planodecontum extends Model
{
	protected $table = 'planodeconta';
	protected $primaryKey = 'pdc_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int',
		'planoDeConta_pdc_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'pdc_codigo',
		'pdc_descricao',
		'entidade_enti_id',
		'planoDeConta_pdc_id'
	];

	public function planodecontum()
	{
		return $this->belongsTo(Planodecontum::class, 'planoDeConta_pdc_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function planodeconta()
	{
		return $this->hasMany(Planodecontum::class, 'planoDeConta_pdc_id');
	}
}
