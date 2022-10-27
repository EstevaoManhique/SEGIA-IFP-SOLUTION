<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Boletim
 * 
 * @property int $bole_id
 * @property string|null $bole_descricao
 * @property string|null $bole_periodo
 * @property string|null $bole_status
 * @property bool $encrypted
 * @property int|null $entidade_enti_id
 * @property int|null $inscricao_insc_id
 * 
 * @property Entidade|null $entidade
 * @property Inscricao|null $inscricao
 *
 * @package App\Models
 */
class Boletim extends Model
{
	protected $table = 'boletim';
	protected $primaryKey = 'bole_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int',
		'inscricao_insc_id' => 'int'
	];

	protected $fillable = [
		'bole_descricao',
		'bole_periodo',
		'bole_status',
		'encrypted',
		'entidade_enti_id',
		'inscricao_insc_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function inscricao()
	{
		return $this->belongsTo(Inscricao::class, 'inscricao_insc_id');
	}
}
