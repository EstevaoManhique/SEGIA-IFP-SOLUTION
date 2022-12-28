<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class SchoolCourse
 * 
 * @property int $id
 * @property int $school_id
 * @property int $course_id
 * @property bool $active
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property School $school
 * @property Course $course
 *
 * @package App\Models
 */
class SchoolCourse extends Model
{
	protected $table = 'school_courses';

	protected $casts = [
		'school_id' => 'int',
		'course_id' => 'int',
		'active' => 'bool'
	];

	protected $fillable = [
		'school_id',
		'course_id',
		'active'
	];

	public function school()
	{
		return $this->belongsTo(School::class, 'course_id');
	}

	public function course()
	{
		return $this->belongsTo(Course::class, 'school_id');
	}
}
