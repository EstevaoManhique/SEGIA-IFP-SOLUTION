<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class User
 * 
 * @property int $id
 * @property int $person_id
 * @property string $name
 * @property string $email
 * @property bool $admin
 * @property Carbon|null $email_verified_at
 * @property string $password
 * @property string|null $remember_token
 * @property bool $online
 * @property bool $status
 * @property Carbon|null $last_login_date
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @package App\Models
 */
class User extends Model
{
	protected $table = 'users';

	protected $casts = [
		'person_id' => 'int',
		'admin' => 'bool',
		'online' => 'bool',
		'status' => 'bool'
	];

	protected $dates = [
		'email_verified_at',
		'last_login_date'
	];

	protected $hidden = [
		'password',
		'remember_token'
	];

	protected $fillable = [
		'person_id',
		'name',
		'email',
		'admin',
		'email_verified_at',
		'password',
		'remember_token',
		'online',
		'status',
		'last_login_date'
	];
}
