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
 * @property string|null $cod
 * @property string|null $enc_name
 * @property string|null $enc_contact
 * @property string|null $enc_email
 * @property string|null $enc_work
 * @property Carbon $created_at
 * @property Carbon $update_at
 * 
 * @property Person $person
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
		'enc_name',
		'enc_contact',
		'enc_email',
		'enc_work',
		'update_at'
	];

	public function person()
	{
		return $this->belongsTo(Person::class);
	}
}
