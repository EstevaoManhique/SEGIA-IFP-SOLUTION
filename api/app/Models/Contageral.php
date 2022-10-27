<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Contageral
 * 
 * @property int $ctg_id
 * @property string|null $ctg_conta
 * @property string|null $ctg_descricao
 * @property bool $ctg_raiz
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Extractocontageral[] $extractocontagerals
 * @property Collection|Factura[] $facturas
 * @property Collection|Lancamento[] $lancamentos
 *
 * @package App\Models
 */
class Contageral extends Model
{
	protected $table = 'contageral';
	protected $primaryKey = 'ctg_id';
	public $timestamps = false;

	protected $casts = [
		'ctg_raiz' => 'bool',
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'ctg_conta',
		'ctg_descricao',
		'ctg_raiz',
		'encrypted',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function extractocontagerals()
	{
		return $this->hasMany(Extractocontageral::class, 'contaGeral_ctg_id');
	}

	public function facturas()
	{
		return $this->hasMany(Factura::class, 'conta_ctg_id');
	}

	public function lancamentos()
	{
		return $this->hasMany(Lancamento::class, 'contaPlano_ctg_id');
	}
}
