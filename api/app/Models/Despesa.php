<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Despesa
 * 
 * @property int $desp_id
 * @property bool $desp_aCredito
 * @property Carbon|null $desp_data
 * @property string|null $desp_descricao
 * @property string|null $desp_fornecedor
 * @property int $desp_nrDocumento
 * @property int $desp_nuit
 * @property int $desp_numeroRequisicoes
 * @property string|null $desp_referencia
 * @property string|null $desp_status
 * @property float $desp_valor
 * @property float $desp_valorExecutado
 * @property float $desp_valorPago
 * @property bool $encrypted
 * @property int|null $Entidade_enti_id
 * @property int|null $tipoDespesa_tipd_id
 * @property int|null $usuario_usua_id
 * 
 * @property Entidade|null $entidade
 * @property Usuario|null $usuario
 * @property Tipodespesa|null $tipodespesa
 *
 * @package App\Models
 */
class Despesa extends Model
{
	protected $table = 'despesa';
	protected $primaryKey = 'desp_id';
	public $timestamps = false;

	protected $casts = [
		'desp_aCredito' => 'bool',
		'desp_nrDocumento' => 'int',
		'desp_nuit' => 'int',
		'desp_numeroRequisicoes' => 'int',
		'desp_valor' => 'float',
		'desp_valorExecutado' => 'float',
		'desp_valorPago' => 'float',
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int',
		'tipoDespesa_tipd_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $dates = [
		'desp_data'
	];

	protected $fillable = [
		'desp_aCredito',
		'desp_data',
		'desp_descricao',
		'desp_fornecedor',
		'desp_nrDocumento',
		'desp_nuit',
		'desp_numeroRequisicoes',
		'desp_referencia',
		'desp_status',
		'desp_valor',
		'desp_valorExecutado',
		'desp_valorPago',
		'encrypted',
		'Entidade_enti_id',
		'tipoDespesa_tipd_id',
		'usuario_usua_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function tipodespesa()
	{
		return $this->belongsTo(Tipodespesa::class, 'tipoDespesa_tipd_id');
	}
}
