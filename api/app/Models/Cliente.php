<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Cliente
 * 
 * @property int $clie_id
 * @property string|null $clie_categoria
 * @property string|null $clie_contaGeral
 * @property string|null $clie_funcao
 * @property int $clie_nid
 * @property float $clie_saldoCredito
 * @property float $clie_saldoDebito
 * @property bool $encrypted
 * @property int|null $Entidade_enti_id
 * @property int|null $pessoapess_pess_id
 * 
 * @property Entidade|null $entidade
 * @property Pessoa|null $pessoa
 * @property Collection|Agendacontacto[] $agendacontactos
 * @property Collection|Contum[] $conta
 * @property Collection|Contacorrente[] $contacorrentes
 * @property Collection|Contracto[] $contractos
 * @property Collection|Fluxo[] $fluxos
 * @property Collection|Guiaremessa[] $guiaremessas
 * @property Collection|Venda[] $vendas
 *
 * @package App\Models
 */
class Cliente extends Model
{
	protected $table = 'cliente';
	protected $primaryKey = 'clie_id';
	public $timestamps = false;

	protected $casts = [
		'clie_nid' => 'int',
		'clie_saldoCredito' => 'float',
		'clie_saldoDebito' => 'float',
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int',
		'pessoapess_pess_id' => 'int'
	];

	protected $fillable = [
		'clie_categoria',
		'clie_contaGeral',
		'clie_funcao',
		'clie_nid',
		'clie_saldoCredito',
		'clie_saldoDebito',
		'encrypted',
		'Entidade_enti_id',
		'pessoapess_pess_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function pessoa()
	{
		return $this->belongsTo(Pessoa::class, 'pessoapess_pess_id');
	}

	public function agendacontactos()
	{
		return $this->hasMany(Agendacontacto::class, 'cliente_clie_id');
	}

	public function conta()
	{
		return $this->hasMany(Contum::class, 'cliente_clie_id');
	}

	public function contacorrentes()
	{
		return $this->hasMany(Contacorrente::class, 'cliente_clie_id');
	}

	public function contractos()
	{
		return $this->hasMany(Contracto::class, 'clienteclie_clie_id');
	}

	public function fluxos()
	{
		return $this->hasMany(Fluxo::class, 'cliente_clie_id');
	}

	public function guiaremessas()
	{
		return $this->hasMany(Guiaremessa::class, 'cliente_clie_id');
	}

	public function vendas()
	{
		return $this->hasMany(Venda::class, 'cliente_clie_id');
	}
}
