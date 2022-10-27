<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Aluno
 * 
 * @property int $alun_id
 * @property string|null $alun_badgnumber
 * @property string|null $alun_bolseiro
 * @property string|null $alun_categoria
 * @property Carbon|null $alun_dataInscricao
 * @property Carbon|null $alun_dataProximoPagamento
 * @property bool $alun_deficiente
 * @property string|null $alun_distrito
 * @property string|null $alun_nivel
 * @property string|null $alun_password
 * @property string|null $alun_provincia
 * @property string|null $alun_status
 * @property int $alun_turno
 * @property string|null $alun_unico
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * @property int|null $escola_esc_id
 * @property int|null $pessoa_pess_id
 * @property int|null $turma_turm_id
 * 
 * @property Turma|null $turma
 * @property Escola|null $escola
 * @property Pessoa|null $pessoa
 * @property Entidade|null $entidade
 * @property Collection|Avaliacao[] $avaliacaos
 * @property Collection|Exame[] $exames
 * @property Collection|Inscricao[] $inscricaos
 * @property Collection|Medium[] $media
 * @property Collection|Mensalidade[] $mensalidades
 * @property Collection|Nota[] $notas
 * @property Collection|Presenca[] $presencas
 * @property Collection|Transferencium[] $transferencia
 *
 * @package App\Models
 */
class Aluno extends Model
{
	protected $table = 'aluno';
	protected $primaryKey = 'alun_id';
	public $timestamps = false;

	protected $casts = [
		'alun_deficiente' => 'bool',
		'alun_turno' => 'int',
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int',
		'escola_esc_id' => 'int',
		'pessoa_pess_id' => 'int',
		'turma_turm_id' => 'int'
	];

	protected $dates = [
		'alun_dataInscricao',
		'alun_dataProximoPagamento'
	];

	protected $hidden = [
		'alun_password'
	];

	protected $fillable = [
		'alun_badgnumber',
		'alun_bolseiro',
		'alun_categoria',
		'alun_dataInscricao',
		'alun_dataProximoPagamento',
		'alun_deficiente',
		'alun_distrito',
		'alun_nivel',
		'alun_password',
		'alun_provincia',
		'alun_status',
		'alun_turno',
		'alun_unico',
		'encrypted',
		'entidade_enti_id',
		'escola_esc_id',
		'pessoa_pess_id',
		'turma_turm_id'
	];

	public function turma()
	{
		return $this->belongsTo(Turma::class, 'turma_turm_id');
	}

	public function escola()
	{
		return $this->belongsTo(Escola::class, 'escola_esc_id');
	}

	public function pessoa()
	{
		return $this->belongsTo(Pessoa::class, 'pessoa_pess_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function avaliacaos()
	{
		return $this->hasMany(Avaliacao::class, 'aluno_alun_id');
	}

	public function exames()
	{
		return $this->hasMany(Exame::class, 'aluno_alun_id');
	}

	public function inscricaos()
	{
		return $this->hasMany(Inscricao::class, 'aluno_alun_id');
	}

	public function media()
	{
		return $this->hasMany(Medium::class, 'aluno_alun_id');
	}

	public function mensalidades()
	{
		return $this->hasMany(Mensalidade::class, 'aluno_alun_id');
	}

	public function notas()
	{
		return $this->hasMany(Nota::class, 'aluno_alun_id');
	}

	public function presencas()
	{
		return $this->hasMany(Presenca::class, 'aluno_alun_id');
	}

	public function transferencia()
	{
		return $this->hasMany(Transferencium::class, 'aluno_alun_id');
	}
}
