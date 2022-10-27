<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Movimento
 * 
 * @property int $mov_id
 * @property bool $encrypted
 * @property string|null $mov_benefeciario
 * @property float $mov_credito
 * @property Carbon|null $mov_data
 * @property Carbon|null $mov_dataEmissao
 * @property float $mov_debito
 * @property string|null $mov_detalhes
 * @property string|null $mov_nrCheque
 * @property string|null $mov_referencia
 * @property float $mov_saldo
 * @property int|null $banco_bnc_id
 * @property int|null $entidade_enti_id
 * @property int|null $usuario_usua_id
 * 
 * @property Entidade|null $entidade
 * @property Usuario|null $usuario
 * @property Banco|null $banco
 *
 * @package App\Models
 */
class Movimento extends Model
{
	protected $table = 'movimento';
	protected $primaryKey = 'mov_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'mov_credito' => 'float',
		'mov_debito' => 'float',
		'mov_saldo' => 'float',
		'banco_bnc_id' => 'int',
		'entidade_enti_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $dates = [
		'mov_data',
		'mov_dataEmissao'
	];

	protected $fillable = [
		'encrypted',
		'mov_benefeciario',
		'mov_credito',
		'mov_data',
		'mov_dataEmissao',
		'mov_debito',
		'mov_detalhes',
		'mov_nrCheque',
		'mov_referencia',
		'mov_saldo',
		'banco_bnc_id',
		'entidade_enti_id',
		'usuario_usua_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function banco()
	{
		return $this->belongsTo(Banco::class, 'banco_bnc_id');
	}
}
