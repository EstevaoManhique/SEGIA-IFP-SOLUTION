<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class SchoolType
 * 
 * @property int $id
 * @property string|null $cod
 * @property string|null $description
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class SchoolType extends Model
{
	protected $table = 'school_type';

	protected $fillable = [
		'cod',
		'description'
	];
}
