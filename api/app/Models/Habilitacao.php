<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Habilitacao
 * 
 * @property int $habi_id
 * @property bool $encrypted
 * @property string|null $habi_descricao
 * @property int|null $Entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Funcionario[] $funcionarios
 *
 * @package App\Models
 */
class Habilitacao extends Model
{
	protected $table = 'habilitacao';
	protected $primaryKey = 'habi_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'habi_descricao',
		'Entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function funcionarios()
	{
		return $this->hasMany(Funcionario::class, 'habilitacao_habi_id');
	}
}
