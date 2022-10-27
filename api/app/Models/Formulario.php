<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Formulario
 * 
 * @property int $form_id
 * @property string|null $form_descricao
 * @property string|null $form_referencia
 * @property int|null $sistema_sist_id
 * 
 * @property Sistema|null $sistema
 * @property Collection|Formulariosusuario[] $formulariosusuarios
 *
 * @package App\Models
 */
class Formulario extends Model
{
	protected $table = 'formulario';
	protected $primaryKey = 'form_id';
	public $timestamps = false;

	protected $casts = [
		'sistema_sist_id' => 'int'
	];

	protected $fillable = [
		'form_descricao',
		'form_referencia',
		'sistema_sist_id'
	];

	public function sistema()
	{
		return $this->belongsTo(Sistema::class, 'sistema_sist_id');
	}

	public function formulariosusuarios()
	{
		return $this->hasMany(Formulariosusuario::class, 'formulario_form_id');
	}
}
