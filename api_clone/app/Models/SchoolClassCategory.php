<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class SchoolClassCategory
 * 
 * @property int $school_id
 * @property int $class_categorory_id
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property School $school
 * @property Category $category
 *
 * @package App\Models
 */
class SchoolClassCategory extends Model
{
	protected $table = 'school_class_categories';
	public $incrementing = false;

	protected $casts = [
		'school_id' => 'int',
		'class_categorory_id' => 'int'
	];

	protected $fillable = [
		'school_id',
		'class_categorory_id'
	];

	public function school()
	{
		return $this->belongsTo(School::class);
	}

	public function category()
	{
		return $this->belongsTo(Category::class, 'class_categorory_id');
	}
}
