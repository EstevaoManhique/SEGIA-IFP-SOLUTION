<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Faltum
 * 
 * @property int $falt_id
 * @property string|null $cod_escola
 * @property int $falt_01
 * @property int $falt_02
 * @property int $falt_03
 * @property int $falt_04
 * @property int $falt_05
 * @property int $falt_06
 * @property int $falt_07
 * @property int $falt_08
 * @property int $falt_09
 * @property int $falt_10
 * @property int $falt_11
 * @property int $falt_12
 * @property string|null $falt_ano
 * @property int $falt_j_01
 * @property int $falt_j_02
 * @property int $falt_j_03
 * @property int $falt_j_04
 * @property int $falt_j_05
 * @property int $falt_j_06
 * @property int $falt_j_07
 * @property int $falt_j_08
 * @property int $falt_j_09
 * @property int $falt_j_10
 * @property int $falt_j_11
 * @property int $falt_j_12
 *
 * @package App\Models
 */
class Faltum extends Model
{
	protected $table = 'falta';
	protected $primaryKey = 'falt_id';
	public $timestamps = false;

	protected $casts = [
		'falt_01' => 'int',
		'falt_02' => 'int',
		'falt_03' => 'int',
		'falt_04' => 'int',
		'falt_05' => 'int',
		'falt_06' => 'int',
		'falt_07' => 'int',
		'falt_08' => 'int',
		'falt_09' => 'int',
		'falt_10' => 'int',
		'falt_11' => 'int',
		'falt_12' => 'int',
		'falt_j_01' => 'int',
		'falt_j_02' => 'int',
		'falt_j_03' => 'int',
		'falt_j_04' => 'int',
		'falt_j_05' => 'int',
		'falt_j_06' => 'int',
		'falt_j_07' => 'int',
		'falt_j_08' => 'int',
		'falt_j_09' => 'int',
		'falt_j_10' => 'int',
		'falt_j_11' => 'int',
		'falt_j_12' => 'int'
	];

	protected $fillable = [
		'cod_escola',
		'falt_01',
		'falt_02',
		'falt_03',
		'falt_04',
		'falt_05',
		'falt_06',
		'falt_07',
		'falt_08',
		'falt_09',
		'falt_10',
		'falt_11',
		'falt_12',
		'falt_ano',
		'falt_j_01',
		'falt_j_02',
		'falt_j_03',
		'falt_j_04',
		'falt_j_05',
		'falt_j_06',
		'falt_j_07',
		'falt_j_08',
		'falt_j_09',
		'falt_j_10',
		'falt_j_11',
		'falt_j_12'
	];
}
