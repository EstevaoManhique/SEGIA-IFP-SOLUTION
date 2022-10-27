<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Matricula
 * 
 * @property int $matr_id
 * @property string|null $cod_escola
 * @property string|null $matr_ano
 * @property int $matr_assistente
 * @property string|null $matr_classe
 * @property int $matr_continuante
 * @property int $matr_faixa_05
 * @property int $matr_faixa_1115
 * @property int $matr_faixa_1625
 * @property int $matr_faixa_2635
 * @property int $matr_faixa_35
 * @property int $matr_faixa_610
 * @property int $matr_homens
 * @property int $matr_mulheres
 * @property int $matr_novo
 * @property int $matr_repetente
 * @property int $matr_transferido
 * @property int $matr_turmas
 * @property int $matr_vuneraveis
 *
 * @package App\Models
 */
class Matricula extends Model
{
	protected $table = 'matricula';
	protected $primaryKey = 'matr_id';
	public $timestamps = false;

	protected $casts = [
		'matr_assistente' => 'int',
		'matr_continuante' => 'int',
		'matr_faixa_05' => 'int',
		'matr_faixa_1115' => 'int',
		'matr_faixa_1625' => 'int',
		'matr_faixa_2635' => 'int',
		'matr_faixa_35' => 'int',
		'matr_faixa_610' => 'int',
		'matr_homens' => 'int',
		'matr_mulheres' => 'int',
		'matr_novo' => 'int',
		'matr_repetente' => 'int',
		'matr_transferido' => 'int',
		'matr_turmas' => 'int',
		'matr_vuneraveis' => 'int'
	];

	protected $fillable = [
		'cod_escola',
		'matr_ano',
		'matr_assistente',
		'matr_classe',
		'matr_continuante',
		'matr_faixa_05',
		'matr_faixa_1115',
		'matr_faixa_1625',
		'matr_faixa_2635',
		'matr_faixa_35',
		'matr_faixa_610',
		'matr_homens',
		'matr_mulheres',
		'matr_novo',
		'matr_repetente',
		'matr_transferido',
		'matr_turmas',
		'matr_vuneraveis'
	];
}
