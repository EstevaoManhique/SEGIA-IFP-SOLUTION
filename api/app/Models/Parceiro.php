<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Parceiro
 * 
 * @property int $parc_id
 * @property bool $encrypted
 * @property string|null $parc_areaActuacao
 * @property string|null $parc_contacto
 * @property string|null $parc_descricao
 * @property string|null $parc_endereco
 * @property string|null $parc_nuit
 * @property string|null $parc_pessoaContacto
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Parceiro extends Model
{
	protected $table = 'parceiro';
	protected $primaryKey = 'parc_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'parc_areaActuacao',
		'parc_contacto',
		'parc_descricao',
		'parc_endereco',
		'parc_nuit',
		'parc_pessoaContacto',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
