<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Student
 * 
 * @property int $id
 * @property int $person_id
 * @property int $school_id
 * @property string $cod
 * @property Carbon $created_at
 * @property Carbon $update_at
 * 
 * @property School $school
 *
 * @package App\Models
 */
class Student extends Model
{
	protected $table = 'students';
	public $timestamps = false;

	protected $casts = [
		'person_id' => 'int',
		'school_id' => 'int'
	];

	protected $dates = [
		'update_at'
	];

	protected $fillable = [
		'person_id',
		'school_id',
		'cod',
		'update_at'
	];

	public function school()
	{
		return $this->belongsTo(School::class);
	}
}
