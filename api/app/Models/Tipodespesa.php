<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Tipodespesa
 * 
 * @property int $tipd_id
 * @property bool $encrypted
 * @property string|null $tipd_categoria
 * @property string|null $tipd_descricao
 * @property int $tipd_numDespesas
 * @property string|null $tipd_periodo
 * @property int $tipd_tempo
 * @property float $tipd_valorExectuado
 * @property float $tipd_valorPlanificado
 * @property int|null $Entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Despesa[] $despesas
 *
 * @package App\Models
 */
class Tipodespesa extends Model
{
	protected $table = 'tipodespesa';
	protected $primaryKey = 'tipd_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'tipd_numDespesas' => 'int',
		'tipd_tempo' => 'int',
		'tipd_valorExectuado' => 'float',
		'tipd_valorPlanificado' => 'float',
		'Entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'tipd_categoria',
		'tipd_descricao',
		'tipd_numDespesas',
		'tipd_periodo',
		'tipd_tempo',
		'tipd_valorExectuado',
		'tipd_valorPlanificado',
		'Entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function despesas()
	{
		return $this->hasMany(Despesa::class, 'tipoDespesa_tipd_id');
	}
}
