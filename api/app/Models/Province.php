<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Province
 * 
 * @property int $id
 * @property string $name
 * @property string|null $cod
 * @property Carbon $created_at
 * @property Carbon $update_at
 * 
 * @property Collection|District[] $districts
 *
 * @package App\Models
 */
class Province extends Model
{
	protected $table = 'provinces';
	public $timestamps = false;

	protected $dates = [
		'update_at'
	];

	protected $fillable = [
		'name',
		'cod',
		'update_at'
	];

	public function districts()
	{
		return $this->hasMany(District::class);
	}
}
