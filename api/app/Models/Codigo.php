<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Codigo
 * 
 * @property int $cod_id
 * @property string|null $cod_codigo
 * @property string|null $cod_descricao
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Doc[] $docs
 *
 * @package App\Models
 */
class Codigo extends Model
{
	protected $table = 'codigo';
	protected $primaryKey = 'cod_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'cod_codigo',
		'cod_descricao',
		'encrypted',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function docs()
	{
		return $this->hasMany(Doc::class, 'codigo_cod_id');
	}
}
