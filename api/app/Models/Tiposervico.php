<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Tiposervico
 * 
 * @property int $tps_id
 * @property bool $encrypted
 * @property string|null $tps_descricao
 * @property bool $tps_igonoraTonelagem
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Tiposervico extends Model
{
	protected $table = 'tiposervico';
	protected $primaryKey = 'tps_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'tps_igonoraTonelagem' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'tps_descricao',
		'tps_igonoraTonelagem',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
