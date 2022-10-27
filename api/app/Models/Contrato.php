<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Contrato
 * 
 * @property int $cont_id
 * @property Carbon|null $cont_data
 * @property Carbon|null $cont_dataConclusao
 * @property Carbon|null $cont_dataEntrega
 * @property Carbon|null $cont_dataVisto
 * @property string|null $cont_descricao
 * @property string|null $cont_empreteiro
 * @property float $cont_execucaoFinanceira
 * @property int $cont_execucaoFisica
 * @property string|null $cont_fonteFinacimento
 * @property string|null $cont_gestor
 * @property string|null $cont_link
 * @property string|null $cont_linkVisto
 * @property string|null $cont_observacoes
 * @property string|null $cont_referencia
 * @property string|null $cont_referencia_2
 * @property string|null $cont_tipoVisto
 * @property float $cont_valor
 * @property float $cont_valorExecutar
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Adenda[] $adendas
 * @property Collection|Requisicaofundo[] $requisicaofundos
 *
 * @package App\Models
 */
class Contrato extends Model
{
	protected $table = 'contrato';
	protected $primaryKey = 'cont_id';
	public $timestamps = false;

	protected $casts = [
		'cont_execucaoFinanceira' => 'float',
		'cont_execucaoFisica' => 'int',
		'cont_valor' => 'float',
		'cont_valorExecutar' => 'float',
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $dates = [
		'cont_data',
		'cont_dataConclusao',
		'cont_dataEntrega',
		'cont_dataVisto'
	];

	protected $fillable = [
		'cont_data',
		'cont_dataConclusao',
		'cont_dataEntrega',
		'cont_dataVisto',
		'cont_descricao',
		'cont_empreteiro',
		'cont_execucaoFinanceira',
		'cont_execucaoFisica',
		'cont_fonteFinacimento',
		'cont_gestor',
		'cont_link',
		'cont_linkVisto',
		'cont_observacoes',
		'cont_referencia',
		'cont_referencia_2',
		'cont_tipoVisto',
		'cont_valor',
		'cont_valorExecutar',
		'encrypted',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function adendas()
	{
		return $this->hasMany(Adenda::class, 'contrato_cont_id');
	}

	public function requisicaofundos()
	{
		return $this->hasMany(Requisicaofundo::class, 'contrato_cont_id');
	}
}
