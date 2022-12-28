<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Permission
 * 
 * @property int $id
 * @property int $role_id
 * @property string $name
 * @property string $description
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property Role $role
 * @property Collection|Role[] $roles
 *
 * @package App\Models
 */
class Permission extends Model
{
	protected $table = 'permissions';

	protected $casts = [
		'role_id' => 'int'
	];

	protected $fillable = [
		'role_id',
		'name',
		'description'
	];

	public function role()
	{
		return $this->belongsTo(Role::class);
	}

	public function roles()
	{
		return $this->belongsToMany(Role::class, 'role_permissions')
					->withPivot('active')
					->withTimestamps();
	}
}
