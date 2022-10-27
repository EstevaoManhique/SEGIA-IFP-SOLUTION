<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Requisicaofundo
 * 
 * @property int $reqf_id
 * @property bool $encrypted
 * @property Carbon|null $reqf_data
 * @property Carbon|null $reqf_dataAlteracao
 * @property Carbon|null $reqf_dataAprovacao
 * @property Carbon|null $reqf_dataAprovacaoRH
 * @property Carbon|null $reqf_dataAprovacaoRegiao
 * @property Carbon|null $reqf_dataAprovacaoSede
 * @property Carbon|null $reqf_dataJustificativo
 * @property string|null $reqf_detalhes
 * @property string|null $reqf_link
 * @property string|null $reqf_linkJustificativo
 * @property string|null $reqf_referencia
 * @property string|null $reqf_segmento
 * @property string|null $reqf_status
 * @property float $reqf_valor
 * @property int|null $contrato_cont_id
 * @property int|null $entidade_enti_id
 * @property int|null $usuario_usua_id
 * @property int|null $usuario2_usua_id
 * @property int|null $usuario3_usua_id
 * @property int|null $usuario4_usua_id
 * 
 * @property Usuario|null $usuario
 * @property Entidade|null $entidade
 * @property Contrato|null $contrato
 *
 * @package App\Models
 */
class Requisicaofundo extends Model
{
	protected $table = 'requisicaofundo';
	protected $primaryKey = 'reqf_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'reqf_valor' => 'float',
		'contrato_cont_id' => 'int',
		'entidade_enti_id' => 'int',
		'usuario_usua_id' => 'int',
		'usuario2_usua_id' => 'int',
		'usuario3_usua_id' => 'int',
		'usuario4_usua_id' => 'int'
	];

	protected $dates = [
		'reqf_data',
		'reqf_dataAlteracao',
		'reqf_dataAprovacao',
		'reqf_dataAprovacaoRH',
		'reqf_dataAprovacaoRegiao',
		'reqf_dataAprovacaoSede',
		'reqf_dataJustificativo'
	];

	protected $fillable = [
		'encrypted',
		'reqf_data',
		'reqf_dataAlteracao',
		'reqf_dataAprovacao',
		'reqf_dataAprovacaoRH',
		'reqf_dataAprovacaoRegiao',
		'reqf_dataAprovacaoSede',
		'reqf_dataJustificativo',
		'reqf_detalhes',
		'reqf_link',
		'reqf_linkJustificativo',
		'reqf_referencia',
		'reqf_segmento',
		'reqf_status',
		'reqf_valor',
		'contrato_cont_id',
		'entidade_enti_id',
		'usuario_usua_id',
		'usuario2_usua_id',
		'usuario3_usua_id',
		'usuario4_usua_id'
	];

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario3_usua_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function contrato()
	{
		return $this->belongsTo(Contrato::class, 'contrato_cont_id');
	}
}
