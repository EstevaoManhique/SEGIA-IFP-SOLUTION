<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Sala
 * 
 * @property int $id
 * @property int $capacidade

 * @package App\Models
 */
class Sala extends Model
{
	protected $table = 'salas';
	protected $primaryKey = 'id';
	public $timestamps = false;

	protected $fillable = [
		'id',
		'capacidade'
	];

	public function school()
	{
		return $this->belongsTo(School::class);
	}
}