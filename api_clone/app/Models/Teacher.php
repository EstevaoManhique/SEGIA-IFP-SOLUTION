<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Teacher
 * 
 * @property int $id
 * @property int $person_id
 * @property string $cod
 * @property string $specialty
 * @property string $degree_formation
 * @property Carbon $created_at
 * @property Carbon $update_at
 * 
 * @property Person $person
 *
 * @package App\Models
 */
class Teacher extends Model
{
	protected $table = 'teachers';
	public $timestamps = false;

	protected $casts = [
		'person_id' => 'int'
	];

	protected $dates = [
		'update_at'
	];

	protected $fillable = [
		'person_id',
		'cod',
		'specialty',
		'degree_formation',
		'update_at'
	];

	public function person()
	{
		return $this->belongsTo(Person::class);
	}
}
