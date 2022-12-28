<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class PasswordReset
 * 
 * @property string $email
 * @property string $token
 * @property Carbon|null $expires_at
 * @property Carbon $created_at
 *
 * @package App\Models
 */
class PasswordReset extends Model
{
	protected $table = 'password_resets';
	public $incrementing = false;
	public $timestamps = false;

	protected $dates = [
		'expires_at'
	];

	protected $hidden = [
		'token'
	];

	protected $fillable = [
		'email',
		'token',
		'expires_at'
	];
}
