<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Itemrequisicaocheque
 * 
 * @property int $irc_id
 * @property bool $encrypted
 * @property string|null $irc_beneficiario
 * @property int $irc_ref
 * @property float $irc_valor
 * @property int|null $entidade_enti_id
 * @property int|null $requisicaoCheque_rqc_id
 * 
 * @property Entidade|null $entidade
 * @property Requisicaocheque|null $requisicaocheque
 *
 * @package App\Models
 */
class Itemrequisicaocheque extends Model
{
	protected $table = 'itemrequisicaocheque';
	protected $primaryKey = 'irc_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'irc_ref' => 'int',
		'irc_valor' => 'float',
		'entidade_enti_id' => 'int',
		'requisicaoCheque_rqc_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'irc_beneficiario',
		'irc_ref',
		'irc_valor',
		'entidade_enti_id',
		'requisicaoCheque_rqc_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function requisicaocheque()
	{
		return $this->belongsTo(Requisicaocheque::class, 'requisicaoCheque_rqc_id');
	}
}
