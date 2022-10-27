<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Areaformacao
 * 
 * @property int $aref_id
 * @property string|null $aref_descricao
 * @property string|null $aref_detalhes
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Curso[] $cursos
 * @property Collection|Docente[] $docentes
 *
 * @package App\Models
 */
class Areaformacao extends Model
{
	protected $table = 'areaformacao';
	protected $primaryKey = 'aref_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'aref_descricao',
		'aref_detalhes',
		'encrypted',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function cursos()
	{
		return $this->hasMany(Curso::class, 'areaFormacao_aref_id');
	}

	public function docentes()
	{
		return $this->hasMany(Docente::class, 'areaFormacao_aref_id');
	}
}
