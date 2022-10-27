<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Funcionario
 * 
 * @property int $func_id
 * @property bool $encrypted
 * @property string|null $func_badgnumber
 * @property string|null $func_conta
 * @property Carbon|null $func_dataAdmissao
 * @property Carbon|null $func_dataValidade
 * @property int $func_dependentes
 * @property string|null $func_formaPagamento
 * @property string|null $func_nib
 * @property int|null $func_numero
 * @property float $func_salario
 * @property float $func_salario_dia
 * @property float $func_salario_hora
 * @property string|null $func_segurancaSocial
 * @property string|null $func_tipo
 * @property string|null $func_tipoContrato
 * @property int $func_turno
 * @property int|null $Entidade_enti_id
 * @property int|null $cargo_car_id
 * @property int|null $departamento_dep_id
 * @property int|null $firmafirm_firm_id
 * @property int|null $habilitacao_habi_id
 * @property int|null $pessoapess_pess_id
 * 
 * @property Departamento|null $departamento
 * @property Firma|null $firma
 * @property Cargo|null $cargo
 * @property Entidade|null $entidade
 * @property Pessoa|null $pessoa
 * @property Habilitacao|null $habilitacao
 * @property Collection|Agendacontacto[] $agendacontactos
 * @property Collection|Contracto[] $contractos
 * @property Collection|Dependente[] $dependentes
 * @property Collection|Falta[] $faltas
 * @property Collection|Feria[] $ferias
 * @property Collection|Folhasalarial[] $folhasalarials
 * @property Collection|Formacao[] $formacaos
 * @property Collection|Hora[] $horas
 * @property Collection|Lancamento[] $lancamentos
 * @property Collection|Petycash[] $petycashes
 * @property Collection|Planosaude[] $planosaudes
 * @property Collection|Requisicao[] $requisicaos
 * @property Collection|Requisicaocheque[] $requisicaocheques
 *
 * @package App\Models
 */
class Funcionario extends Model
{
	protected $table = 'funcionario';
	protected $primaryKey = 'func_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'func_dependentes' => 'int',
		'func_numero' => 'int',
		'func_salario' => 'float',
		'func_salario_dia' => 'float',
		'func_salario_hora' => 'float',
		'func_turno' => 'int',
		'Entidade_enti_id' => 'int',
		'cargo_car_id' => 'int',
		'departamento_dep_id' => 'int',
		'firmafirm_firm_id' => 'int',
		'habilitacao_habi_id' => 'int',
		'pessoapess_pess_id' => 'int'
	];

	protected $dates = [
		'func_dataAdmissao',
		'func_dataValidade'
	];

	protected $fillable = [
		'encrypted',
		'func_badgnumber',
		'func_conta',
		'func_dataAdmissao',
		'func_dataValidade',
		'func_dependentes',
		'func_formaPagamento',
		'func_nib',
		'func_numero',
		'func_salario',
		'func_salario_dia',
		'func_salario_hora',
		'func_segurancaSocial',
		'func_tipo',
		'func_tipoContrato',
		'func_turno',
		'Entidade_enti_id',
		'cargo_car_id',
		'departamento_dep_id',
		'firmafirm_firm_id',
		'habilitacao_habi_id',
		'pessoapess_pess_id'
	];

	public function departamento()
	{
		return $this->belongsTo(Departamento::class, 'departamento_dep_id');
	}

	public function firma()
	{
		return $this->belongsTo(Firma::class, 'firmafirm_firm_id');
	}

	public function cargo()
	{
		return $this->belongsTo(Cargo::class, 'cargo_car_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function pessoa()
	{
		return $this->belongsTo(Pessoa::class, 'pessoapess_pess_id');
	}

	public function habilitacao()
	{
		return $this->belongsTo(Habilitacao::class, 'habilitacao_habi_id');
	}

	public function agendacontactos()
	{
		return $this->hasMany(Agendacontacto::class, 'funcionario_func_id');
	}

	public function contractos()
	{
		return $this->hasMany(Contracto::class, 'funcionario_func_id');
	}

	public function dependentes()
	{
		return $this->hasMany(Dependente::class, 'funcionario_func_id');
	}

	public function faltas()
	{
		return $this->hasMany(Falta::class, 'funcionario_func_id');
	}

	public function ferias()
	{
		return $this->hasMany(Feria::class, 'funcionario_func_id');
	}

	public function folhasalarials()
	{
		return $this->hasMany(Folhasalarial::class, 'funcionario_func_id');
	}

	public function formacaos()
	{
		return $this->hasMany(Formacao::class, 'funcionario_func_id');
	}

	public function horas()
	{
		return $this->hasMany(Hora::class, 'funcionario_func_id');
	}

	public function lancamentos()
	{
		return $this->hasMany(Lancamento::class, 'funcionario_func_id');
	}

	public function petycashes()
	{
		return $this->hasMany(Petycash::class, 'funcionario_func_id');
	}

	public function planosaudes()
	{
		return $this->hasMany(Planosaude::class, 'funcionario_func_id');
	}

	public function requisicaos()
	{
		return $this->hasMany(Requisicao::class, 'funcionario_func_id');
	}

	public function requisicaocheques()
	{
		return $this->hasMany(Requisicaocheque::class, 'funcionario_func_id');
	}
}
