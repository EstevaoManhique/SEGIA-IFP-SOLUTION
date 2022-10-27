<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Estadofactura
 * 
 * @property int $estf_id
 * @property bool $encrypted
 * @property string|null $estf_descricao
 *
 * @package App\Models
 */
class Estadofactura extends Model
{
	protected $table = 'estadofactura';
	protected $primaryKey = 'estf_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool'
	];

	protected $fillable = [
		'encrypted',
		'estf_descricao'
	];
}
