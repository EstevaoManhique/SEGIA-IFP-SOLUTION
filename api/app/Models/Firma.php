<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Firma
 * 
 * @property int $firm_id
 * @property bool $encrypted
 * @property string|null $firm_contacto
 * @property string|null $firm_descricao
 * @property string|null $firm_endereco
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Funcionario[] $funcionarios
 *
 * @package App\Models
 */
class Firma extends Model
{
	protected $table = 'firma';
	protected $primaryKey = 'firm_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'firm_contacto',
		'firm_descricao',
		'firm_endereco',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function funcionarios()
	{
		return $this->hasMany(Funcionario::class, 'firmafirm_firm_id');
	}
}
