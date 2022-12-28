<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class RolePermission
 * 
 * @property int $role_id
 * @property int $permission_id
 * @property bool $active
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property Role $role
 * @property Permission $permission
 *
 * @package App\Models
 */
class RolePermission extends Model
{
	protected $table = 'role_permissions';
	public $incrementing = false;

	protected $casts = [
		'role_id' => 'int',
		'permission_id' => 'int',
		'active' => 'bool'
	];

	protected $fillable = [
		'role_id',
		'permission_id',
		'active'
	];

	public function role()
	{
		return $this->belongsTo(Role::class);
	}

	public function permission()
	{
		return $this->belongsTo(Permission::class);
	}
}
