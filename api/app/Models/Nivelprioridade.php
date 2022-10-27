<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Nivelprioridade
 * 
 * @property int $nvp_id
 * @property bool $encrypted
 * @property string|null $nvp_descricao
 * 
 * @property Collection|Departamento[] $departamentos
 *
 * @package App\Models
 */
class Nivelprioridade extends Model
{
	protected $table = 'nivelprioridade';
	protected $primaryKey = 'nvp_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool'
	];

	protected $fillable = [
		'encrypted',
		'nvp_descricao'
	];

	public function departamentos()
	{
		return $this->hasMany(Departamento::class, 'nivelPrioridade_nvp_id');
	}
}
