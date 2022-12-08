<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Course
 * 
 * @property int $id
 * @property string|null $cod
 * @property string|null $description
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class Course extends Model
{
	protected $table = 'courses';

	protected $fillable = [
		'cod',
		'description'
	];
	
}
