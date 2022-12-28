<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Subject
 * 
 * @property int $id
 * @property string $cod
 * @property string $description
 * @property Carbon $created_at
 * @property Carbon $update_at
 * 
 * @property Collection|Course[] $courses
 *
 * @package App\Models
 */
class Subject extends Model
{
	protected $table = 'subjects';
	public $timestamps = false;

	protected $dates = [
		'update_at'
	];

	protected $fillable = [
		'cod',
		'description',
		'update_at'
	];

	public function courses()
	{
		return $this->belongsToMany(Course::class, 'course_subjects', 'subject_id', 'class_id')
					->withPivot('active')
					->withTimestamps();
	}
}
