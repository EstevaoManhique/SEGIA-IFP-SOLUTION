<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class SchoolCategory
 * 
 * @property int $id
 * @property int $school_id
 * @property int $category_id
 * @property bool $active
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property School $school
 * @property Category $category
 *
 * @package App\Models
 */
class SchoolCategory extends Model
{
	protected $table = 'school_categories';

	protected $casts = [
		'school_id' => 'int',
		'category_id' => 'int',
		'active' => 'bool'
	];

	protected $fillable = [
		'school_id',
		'category_id',
		'active'
	];

	public function school()
	{
		return $this->belongsTo(School::class);
	}

	public function category()
	{
		return $this->belongsTo(Category::class);
	}
}
