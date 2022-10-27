<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Cidade
 * 
 * @property int $cida_id
 * @property string|null $cida_descricao
 * @property bool $encrypted
 *
 * @package App\Models
 */
class Cidade extends Model
{
	protected $table = 'cidade';
	protected $primaryKey = 'cida_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool'
	];

	protected $fillable = [
		'cida_descricao',
		'encrypted'
	];
}
