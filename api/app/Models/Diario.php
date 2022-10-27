<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Diario
 * 
 * @property int $dir_id
 * @property string|null $dir_nome
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Lancamento[] $lancamentos
 *
 * @package App\Models
 */
class Diario extends Model
{
	protected $table = 'diario';
	protected $primaryKey = 'dir_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'dir_nome',
		'encrypted',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function lancamentos()
	{
		return $this->hasMany(Lancamento::class, 'diario_dir_id');
	}
}
