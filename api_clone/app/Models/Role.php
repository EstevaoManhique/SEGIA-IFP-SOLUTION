<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Role
 * 
 * @property int $id
 * @property string $name
 * @property string $description
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property Collection|Permission[] $permissions
 * @property Collection|User[] $users
 *
 * @package App\Models
 */
class Role extends Model
{
	protected $table = 'roles';

	protected $fillable = [
		'name',
		'description'
	];

	public function permissions()
	{
		return $this->belongsToMany(Permission::class, 'role_permissions')
					->withPivot('active')
					->withTimestamps();
	}

	public function users()
	{
		return $this->belongsToMany(User::class, 'user_roles')
					->withPivot('active', 'assign_by')
					->withTimestamps();
	}
}
