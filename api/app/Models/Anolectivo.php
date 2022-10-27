<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Anolectivo
 * 
 * @property int $anol_id
 * @property bool $anol_corrente
 * @property string|null $anol_descricao
 * @property string|null $anol_status
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Agenda[] $agendas
 * @property Collection|Calendario[] $calendarios
 * @property Collection|Calendarioexame[] $calendarioexames
 * @property Collection|Exame[] $exames
 * @property Collection|Inscricao[] $inscricaos
 * @property Collection|Medium[] $media
 * @property Collection|Nota[] $notas
 * @property Collection|Respostum[] $resposta
 * @property Collection|Salaexame[] $salaexames
 * @property Collection|Turma[] $turmas
 * @property Collection|Vaga[] $vagas
 *
 * @package App\Models
 */
class Anolectivo extends Model
{
	protected $table = 'anolectivo';
	protected $primaryKey = 'anol_id';
	public $timestamps = false;

	protected $casts = [
		'anol_corrente' => 'bool',
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'anol_corrente',
		'anol_descricao',
		'anol_status',
		'encrypted',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function agendas()
	{
		return $this->hasMany(Agenda::class, 'anoLectivo_anol_id');
	}

	public function calendarios()
	{
		return $this->hasMany(Calendario::class, 'anoLectivo_anol_id');
	}

	public function calendarioexames()
	{
		return $this->hasMany(Calendarioexame::class, 'anoLectivo_anol_id');
	}

	public function exames()
	{
		return $this->hasMany(Exame::class, 'anoLectivo_anol_id');
	}

	public function inscricaos()
	{
		return $this->hasMany(Inscricao::class, 'anoLectivo_anol_id');
	}

	public function media()
	{
		return $this->hasMany(Medium::class, 'anoLectivo_anol_id');
	}

	public function notas()
	{
		return $this->hasMany(Nota::class, 'anoLectivo_anol_id');
	}

	public function resposta()
	{
		return $this->hasMany(Respostum::class, 'anoLectivo_anol_id');
	}

	public function salaexames()
	{
		return $this->hasMany(Salaexame::class, 'anoLectivo_anol_id');
	}

	public function turmas()
	{
		return $this->hasMany(Turma::class, 'anoLectivo_anol_id');
	}

	public function vagas()
	{
		return $this->hasMany(Vaga::class, 'anoLectivo_anol_id');
	}
}
