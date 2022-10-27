<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Documento
 * 
 * @property int $doc_id
 * @property string|null $doc_nome
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Factura[] $facturas
 * @property Collection|Lancamento[] $lancamentos
 *
 * @package App\Models
 */
class Documento extends Model
{
	protected $table = 'documento';
	protected $primaryKey = 'doc_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'doc_nome',
		'encrypted',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function facturas()
	{
		return $this->hasMany(Factura::class, 'documento_doc_id');
	}

	public function lancamentos()
	{
		return $this->hasMany(Lancamento::class, 'documento_doc_id');
	}
}
