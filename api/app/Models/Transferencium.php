<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Transferencium
 * 
 * @property int $trans_id
 * @property Carbon|null $trans_data
 * @property string|null $trans_status
 * @property int|null $aluno_alun_id
 * @property int|null $entidade_enti_id
 * @property int|null $entidade2_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Aluno|null $aluno
 *
 * @package App\Models
 */
class Transferencium extends Model
{
	protected $table = 'transferencia';
	protected $primaryKey = 'trans_id';
	public $timestamps = false;

	protected $casts = [
		'aluno_alun_id' => 'int',
		'entidade_enti_id' => 'int',
		'entidade2_enti_id' => 'int'
	];

	protected $dates = [
		'trans_data'
	];

	protected $fillable = [
		'trans_data',
		'trans_status',
		'aluno_alun_id',
		'entidade_enti_id',
		'entidade2_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade2_enti_id');
	}

	public function aluno()
	{
		return $this->belongsTo(Aluno::class, 'aluno_alun_id');
	}
}
