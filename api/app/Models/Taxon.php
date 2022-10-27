<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Taxon
 * 
 * @property int $taxa_id
 * @property bool $encrypted
 * @property string|null $taxa_descricao
 * @property float $taxa_valor
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Taxon extends Model
{
	protected $table = 'taxa';
	protected $primaryKey = 'taxa_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'taxa_valor' => 'float',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'taxa_descricao',
		'taxa_valor',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
