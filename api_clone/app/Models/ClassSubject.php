<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ClassSubject
 * 
 * @property int $class_id
 * @property int $subject_id
 * @property bool $active
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property Class $class
 * @property Subject $subject
 *
 * @package App\Models
 */
class ClassSubject extends Model
{
	protected $table = 'class_subjects';
	public $incrementing = false;

	protected $casts = [
		'class_id' => 'int',
		'subject_id' => 'int',
		'active' => 'bool'
	];

	protected $fillable = [
		'active'
	];

	public function class()
	{
		return $this->belongsTo(Class::class);
	}

	public function subject()
	{
		return $this->belongsTo(Subject::class);
	}
}
