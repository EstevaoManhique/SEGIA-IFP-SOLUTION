<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Browser
 * 
 * @property int $bro_id
 * @property Carbon|null $bro_data
 * @property string|null $bro_descricao
 * @property string|null $bro_lembre
 * @property int|null $usuario_usua_id
 * 
 * @property Usuario|null $usuario
 *
 * @package App\Models
 */
class Browser extends Model
{
	protected $table = 'browser';
	protected $primaryKey = 'bro_id';
	public $timestamps = false;

	protected $casts = [
		'usuario_usua_id' => 'int'
	];

	protected $dates = [
		'bro_data'
	];

	protected $fillable = [
		'bro_data',
		'bro_descricao',
		'bro_lembre',
		'usuario_usua_id'
	];

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}
}
