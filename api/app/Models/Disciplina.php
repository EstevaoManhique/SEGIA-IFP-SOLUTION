<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Disciplina
 * 
 * @property int $disc_id
 * @property int $disc_cargaHoraria
 * @property string|null $disc_codigo
 * @property string|null $disc_descricao
 * @property string|null $disc_grupo
 * @property string|null $disc_semestre
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Agenda[] $agendas
 * @property Collection|Calendario[] $calendarios
 * @property Collection|Calendarioexame[] $calendarioexames
 * @property Collection|Curso[] $cursos
 * @property Collection|Docente[] $docentes
 * @property Collection|Exame[] $exames
 * @property Collection|Medium[] $media
 * @property Collection|Nota[] $notas
 * @property Collection|Presenca[] $presencas
 * @property Collection|Respostum[] $resposta
 * @property Collection|Salaexame[] $salaexames
 * @property Collection|Sumario[] $sumarios
 * @property Collection|Tema[] $temas
 *
 * @package App\Models
 */
class Disciplina extends Model
{
	protected $table = 'disciplina';
	protected $primaryKey = 'disc_id';
	public $timestamps = false;

	protected $casts = [
		'disc_cargaHoraria' => 'int',
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'disc_cargaHoraria',
		'disc_codigo',
		'disc_descricao',
		'disc_grupo',
		'disc_semestre',
		'encrypted',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function agendas()
	{
		return $this->hasMany(Agenda::class, 'disciplina_disc_id');
	}

	public function calendarios()
	{
		return $this->hasMany(Calendario::class, 'disciplina_disc_id');
	}

	public function calendarioexames()
	{
		return $this->hasMany(Calendarioexame::class, 'disciplina_disc_id');
	}

	public function cursos()
	{
		return $this->belongsToMany(Curso::class, 'disciplinacurso', 'disciplina_disc_id', 'curso_curs_id')
					->withPivot('disd_id', 'disd_semestre', 'encrypted', 'entidade_enti_id');
	}

	public function docentes()
	{
		return $this->belongsToMany(Docente::class, 'disciplinadocente', 'disciplina_disc_id', 'docente_doce_id')
					->withPivot('disd_id', 'entidade_enti_id');
	}

	public function exames()
	{
		return $this->hasMany(Exame::class, 'disciplina_disc_id');
	}

	public function media()
	{
		return $this->hasMany(Medium::class, 'disciplina_disc_id');
	}

	public function notas()
	{
		return $this->hasMany(Nota::class, 'disciplina_disc_id');
	}

	public function presencas()
	{
		return $this->hasMany(Presenca::class, 'disciplina_disc_id');
	}

	public function resposta()
	{
		return $this->hasMany(Respostum::class, 'disciplina_disc_id');
	}

	public function salaexames()
	{
		return $this->hasMany(Salaexame::class, 'disciplina_disc_id');
	}

	public function sumarios()
	{
		return $this->hasMany(Sumario::class, 'disciplina_disc_id');
	}

	public function temas()
	{
		return $this->hasMany(Tema::class, 'disciplina_disc_id');
	}
}
