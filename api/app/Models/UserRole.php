<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class UserRole
 * 
 * @property int $user_id
 * @property int $role_id
 * @property bool $active
 * @property string $assign_by
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property Role $role
 * @property User $user
 *
 * @package App\Models
 */
class UserRole extends Model
{
	protected $table = 'user_roles';
	public $incrementing = false;

	protected $casts = [
		'user_id' => 'int',
		'role_id' => 'int',
		'active' => 'bool'
	];

	protected $fillable = [
		'user_id',
		'role_id',
		'active',
		'assign_by'
	];

	public function role()
	{
		return $this->belongsTo(Role::class);
	}

	public function user()
	{
		return $this->belongsTo(User::class);
	}
}
