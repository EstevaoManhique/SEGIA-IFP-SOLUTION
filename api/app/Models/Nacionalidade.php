<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Nacionalidade
 * 
 * @property int $naci_id
 * @property bool $encrypted
 * @property string|null $naci_descricao
 * 
 * @property Collection|Pessoa[] $pessoas
 *
 * @package App\Models
 */
class Nacionalidade extends Model
{
	protected $table = 'nacionalidade';
	protected $primaryKey = 'naci_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool'
	];

	protected $fillable = [
		'encrypted',
		'naci_descricao'
	];

	public function pessoas()
	{
		return $this->hasMany(Pessoa::class, 'nacionalidadenaci_naci_id');
	}
}
