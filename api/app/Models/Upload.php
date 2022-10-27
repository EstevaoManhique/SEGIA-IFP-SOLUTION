<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Upload
 * 
 * @property int $upl_id
 * @property string|null $upl_file
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Upload extends Model
{
	protected $table = 'upload';
	protected $primaryKey = 'upl_id';
	public $timestamps = false;

	protected $casts = [
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'upl_file',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
