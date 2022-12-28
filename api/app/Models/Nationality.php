<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Nationality
 * 
 * @property int $id
 * @property string $cod
 * @property string $description
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class Nationality extends Model
{
	protected $table = 'nationalities';

	protected $fillable = [
		'cod',
		'description'
	];
}
