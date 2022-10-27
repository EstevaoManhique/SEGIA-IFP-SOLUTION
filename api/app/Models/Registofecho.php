<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Registofecho
 * 
 * @property int $regf_id
 * @property Carbon|null $regf_data
 * @property int $regf_qtd
 * @property int|null $entidade_enti_id
 * @property int|null $fecho_fech_id
 * @property int|null $produto_pro_id
 * 
 * @property Fecho|null $fecho
 * @property Produto|null $produto
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Registofecho extends Model
{
	protected $table = 'registofecho';
	protected $primaryKey = 'regf_id';
	public $timestamps = false;

	protected $casts = [
		'regf_qtd' => 'int',
		'entidade_enti_id' => 'int',
		'fecho_fech_id' => 'int',
		'produto_pro_id' => 'int'
	];

	protected $dates = [
		'regf_data'
	];

	protected $fillable = [
		'regf_data',
		'regf_qtd',
		'entidade_enti_id',
		'fecho_fech_id',
		'produto_pro_id'
	];

	public function fecho()
	{
		return $this->belongsTo(Fecho::class, 'fecho_fech_id');
	}

	public function produto()
	{
		return $this->belongsTo(Produto::class, 'produto_pro_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
