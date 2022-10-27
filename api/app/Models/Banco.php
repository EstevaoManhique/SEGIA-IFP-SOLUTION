<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Banco
 * 
 * @property int $bnc_id
 * @property string|null $bnc_conta
 * @property string|null $bnc_logo
 * @property string|null $bnc_moeda
 * @property string|null $bnc_nib
 * @property string|null $bnc_nome
 * @property float $bnc_saldo
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Movimento[] $movimentos
 *
 * @package App\Models
 */
class Banco extends Model
{
	protected $table = 'banco';
	protected $primaryKey = 'bnc_id';
	public $timestamps = false;

	protected $casts = [
		'bnc_saldo' => 'float',
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'bnc_conta',
		'bnc_logo',
		'bnc_moeda',
		'bnc_nib',
		'bnc_nome',
		'bnc_saldo',
		'encrypted',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function movimentos()
	{
		return $this->hasMany(Movimento::class, 'banco_bnc_id');
	}
}
