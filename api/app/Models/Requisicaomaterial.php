<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Requisicaomaterial
 * 
 * @property int $reqm_id
 * @property bool $encrypted
 * @property Carbon|null $reqm_data
 * @property Carbon|null $reqm_dataAlteracao
 * @property Carbon|null $reqm_dataAprovacao
 * @property string|null $reqm_descricao
 * @property string|null $reqm_documento
 * @property string|null $reqm_observacoes
 * @property string|null $reqm_referencia
 * @property string|null $reqm_status
 * @property int|null $entidade_enti_id
 * @property int|null $pessoa_pess_id
 * 
 * @property Pessoa|null $pessoa
 * @property Entidade|null $entidade
 * @property Collection|Produtorequisicao[] $produtorequisicaos
 *
 * @package App\Models
 */
class Requisicaomaterial extends Model
{
	protected $table = 'requisicaomaterial';
	protected $primaryKey = 'reqm_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int',
		'pessoa_pess_id' => 'int'
	];

	protected $dates = [
		'reqm_data',
		'reqm_dataAlteracao',
		'reqm_dataAprovacao'
	];

	protected $fillable = [
		'encrypted',
		'reqm_data',
		'reqm_dataAlteracao',
		'reqm_dataAprovacao',
		'reqm_descricao',
		'reqm_documento',
		'reqm_observacoes',
		'reqm_referencia',
		'reqm_status',
		'entidade_enti_id',
		'pessoa_pess_id'
	];

	public function pessoa()
	{
		return $this->belongsTo(Pessoa::class, 'pessoa_pess_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function produtorequisicaos()
	{
		return $this->hasMany(Produtorequisicao::class, 'requisicaoMaterial_reqm_id');
	}
}
