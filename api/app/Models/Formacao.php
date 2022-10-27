<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Formacao
 * 
 * @property int $frm_id
 * @property bool $encrypted
 * @property int $frm_cargahoraria
 * @property Carbon|null $frm_dataconclusao
 * @property string|null $frm_descricao
 * @property string|null $frm_status
 * @property int|null $Entidade_enti_id
 * @property int|null $funcionario_func_id
 * 
 * @property Entidade|null $entidade
 * @property Funcionario|null $funcionario
 *
 * @package App\Models
 */
class Formacao extends Model
{
	protected $table = 'formacao';
	protected $primaryKey = 'frm_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'frm_cargahoraria' => 'int',
		'Entidade_enti_id' => 'int',
		'funcionario_func_id' => 'int'
	];

	protected $dates = [
		'frm_dataconclusao'
	];

	protected $fillable = [
		'encrypted',
		'frm_cargahoraria',
		'frm_dataconclusao',
		'frm_descricao',
		'frm_status',
		'Entidade_enti_id',
		'funcionario_func_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'funcionario_func_id');
	}
}
