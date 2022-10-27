<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Assiduidade
 * 
 * @property int $assi_id
 * @property Carbon|null $assi_data
 * @property string|null $assi_horaEntrada
 * @property string|null $assi_horaSaida
 * @property bool $encrypted
 * @property int|null $Entidade_enti_id
 * @property int|null $pessoa_pess_id
 * 
 * @property Pessoa|null $pessoa
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Assiduidade extends Model
{
	protected $table = 'assiduidade';
	protected $primaryKey = 'assi_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'Entidade_enti_id' => 'int',
		'pessoa_pess_id' => 'int'
	];

	protected $dates = [
		'assi_data'
	];

	protected $fillable = [
		'assi_data',
		'assi_horaEntrada',
		'assi_horaSaida',
		'encrypted',
		'Entidade_enti_id',
		'pessoa_pess_id'
	];

	public function pessoa()
	{
		return $this->belongsTo(Pessoa::class, 'pessoa_pess_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}
}
