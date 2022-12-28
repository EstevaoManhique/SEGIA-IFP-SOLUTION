<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class CourseSubject
 * 
 * @property int $class_id
 * @property int $subject_id
 * @property bool $active
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property Course $course
 * @property Subject $subject
 *
 * @package App\Models
 */
class CourseSubject extends Model
{
	protected $table = 'course_subjects';
	public $incrementing = false;

	protected $casts = [
		'class_id' => 'int',
		'subject_id' => 'int',
		'active' => 'bool'
	];

	protected $fillable = [
		'active'
	];

	public function course()
	{
		return $this->belongsTo(Course::class, 'class_id');
	}

	public function subject()
	{
		return $this->belongsTo(Subject::class);
	}
}
