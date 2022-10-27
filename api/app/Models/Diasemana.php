<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Diasemana
 * 
 * @property int $dias_id
 * @property string|null $dias_descricao
 * @property bool $encrypted
 *
 * @package App\Models
 */
class Diasemana extends Model
{
	protected $table = 'diasemana';
	protected $primaryKey = 'dias_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool'
	];

	protected $fillable = [
		'dias_descricao',
		'encrypted'
	];
}
