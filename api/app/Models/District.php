<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class District
 * 
 * @property int $id
 * @property int $province_id
 * @property string|null $cod
 * @property string $name
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property Province $province
 * @property Collection|School[] $schools
 *
 * @package App\Models
 */
class District extends Model
{
	protected $table = 'districts';

	protected $casts = [
		'province_id' => 'int'
	];

	protected $fillable = [
		'province_id',
		'cod',
		'name'
	];

	public function province()
	{
		return $this->belongsTo(Province::class);
	}

	public function schools()
	{
		return $this->hasMany(School::class);
	}
}
