<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Escola
 * 
 * @property int $esc_id
 * @property string|null $cod_escola
 * @property int $esc_alunos
 * @property int $esc_alunos_homens
 * @property int $esc_alunos_mulheres
 * @property int $esc_alunos_necessitados
 * @property string|null $esc_contacto
 * @property string|null $esc_descricao
 * @property string|null $esc_distrito
 * @property int $esc_docentes
 * @property string|null $esc_endereco
 * @property int $esc_faixa_05
 * @property int $esc_faixa_1115
 * @property int $esc_faixa_1625
 * @property int $esc_faixa_2635
 * @property int $esc_faixa_35
 * @property int $esc_faixa_610
 * @property int $esc_membros_homens
 * @property int $esc_membros_mulheres
 * @property string|null $esc_provincia
 * @property int $esc_salas
 * @property float $esc_saldo
 * @property int $esc_turmas
 * 
 * @property Collection|Actum[] $acta
 * @property Collection|Aluno[] $alunos
 * @property Collection|Convocado[] $convocados
 * @property Collection|Convocatorium[] $convocatoria
 * @property Collection|Doc[] $docs
 * @property Collection|Sala[] $salas
 * @property Collection|Sumario[] $sumarios
 * @property Collection|Tema[] $temas
 * @property Collection|Turma[] $turmas
 * @property Collection|Usuario[] $usuarios
 *
 * @package App\Models
 */
class Escola extends Model
{
	protected $table = 'escola';
	protected $primaryKey = 'esc_id';
	public $timestamps = false;

	protected $casts = [
		'esc_alunos' => 'int',
		'esc_alunos_homens' => 'int',
		'esc_alunos_mulheres' => 'int',
		'esc_alunos_necessitados' => 'int',
		'esc_docentes' => 'int',
		'esc_faixa_05' => 'int',
		'esc_faixa_1115' => 'int',
		'esc_faixa_1625' => 'int',
		'esc_faixa_2635' => 'int',
		'esc_faixa_35' => 'int',
		'esc_faixa_610' => 'int',
		'esc_membros_homens' => 'int',
		'esc_membros_mulheres' => 'int',
		'esc_salas' => 'int',
		'esc_saldo' => 'float',
		'esc_turmas' => 'int'
	];

	protected $fillable = [
		'cod_escola',
		'esc_alunos',
		'esc_alunos_homens',
		'esc_alunos_mulheres',
		'esc_alunos_necessitados',
		'esc_contacto',
		'esc_descricao',
		'esc_distrito',
		'esc_docentes',
		'esc_endereco',
		'esc_faixa_05',
		'esc_faixa_1115',
		'esc_faixa_1625',
		'esc_faixa_2635',
		'esc_faixa_35',
		'esc_faixa_610',
		'esc_membros_homens',
		'esc_membros_mulheres',
		'esc_provincia',
		'esc_salas',
		'esc_saldo',
		'esc_turmas'
	];

	public function acta()
	{
		return $this->hasMany(Actum::class, 'escola_esc_id');
	}

	public function alunos()
	{
		return $this->hasMany(Aluno::class, 'escola_esc_id');
	}

	public function convocados()
	{
		return $this->hasMany(Convocado::class, 'escola_esc_id');
	}

	public function convocatoria()
	{
		return $this->hasMany(Convocatorium::class, 'escola_esc_id');
	}

	public function docs()
	{
		return $this->hasMany(Doc::class, 'escola_esc_id');
	}

	public function salas()
	{
		return $this->hasMany(Sala::class, 'escola_esc_id');
	}

	public function sumarios()
	{
		return $this->hasMany(Sumario::class, 'escola_esc_id');
	}

	public function temas()
	{
		return $this->hasMany(Tema::class, 'escola_esc_id');
	}

	public function turmas()
	{
		return $this->hasMany(Turma::class, 'escola_esc_id');
	}

	public function usuarios()
	{
		return $this->hasMany(Usuario::class, 'escola_esc_id');
	}
}
