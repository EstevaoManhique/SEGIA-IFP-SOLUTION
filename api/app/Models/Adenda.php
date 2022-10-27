<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Adenda
 * 
 * @property int $aden_id
 * @property Carbon|null $aden_data
 * @property Carbon|null $aden_dataAprovacao
 * @property Carbon|null $aden_dataAprovacaoRegiao
 * @property Carbon|null $aden_dataAprovacaoSede
 * @property Carbon|null $aden_dataJustificativo
 * @property string|null $aden_detalhes
 * @property string|null $aden_link
 * @property string|null $aden_referencia
 * @property string|null $aden_status
 * @property float $aden_valor
 * @property bool $encrypted
 * @property int|null $contrato_cont_id
 * @property int|null $entidade_enti_id
 * @property int|null $usuario_usua_id
 * @property int|null $usuario2_usua_id
 * @property int|null $usuario3_usua_id
 * 
 * @property Entidade|null $entidade
 * @property Usuario|null $usuario
 * @property Contrato|null $contrato
 *
 * @package App\Models
 */
class Adenda extends Model
{
	protected $table = 'adenda';
	protected $primaryKey = 'aden_id';
	public $timestamps = false;

	protected $casts = [
		'aden_valor' => 'float',
		'encrypted' => 'bool',
		'contrato_cont_id' => 'int',
		'entidade_enti_id' => 'int',
		'usuario_usua_id' => 'int',
		'usuario2_usua_id' => 'int',
		'usuario3_usua_id' => 'int'
	];

	protected $dates = [
		'aden_data',
		'aden_dataAprovacao',
		'aden_dataAprovacaoRegiao',
		'aden_dataAprovacaoSede',
		'aden_dataJustificativo'
	];

	protected $fillable = [
		'aden_data',
		'aden_dataAprovacao',
		'aden_dataAprovacaoRegiao',
		'aden_dataAprovacaoSede',
		'aden_dataJustificativo',
		'aden_detalhes',
		'aden_link',
		'aden_referencia',
		'aden_status',
		'aden_valor',
		'encrypted',
		'contrato_cont_id',
		'entidade_enti_id',
		'usuario_usua_id',
		'usuario2_usua_id',
		'usuario3_usua_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function contrato()
	{
		return $this->belongsTo(Contrato::class, 'contrato_cont_id');
	}
}
