<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Person
 * 
 * @property int $id
 * @property string $name
 * @property string|null $surname
 * @property string|null $genre
 * @property string|null $marital_status
 * @property string|null $mother_name
 * @property string|null $father_name
 * @property string|null $mother_contact
 * @property string|null $father_contact
 * @property Carbon|null $birth_date
 * @property string|null $BI_number
 * @property Carbon|null $BI_expiration_date
 * @property string|null $email
 * @property string|null $contact
 * @property int|null $nationality_id
 * @property string|null $profile_picture
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property Collection|User[] $users
 *
 * @package App\Models
 */
class Person extends Model
{
	protected $table = 'persons';

	protected $casts = [
		'nationality_id' => 'int'
	];

	protected $dates = [
		'birth_date',
		'BI_expiration_date'
	];

	protected $fillable = [
		'name',
		'surname',
		'genre',
		'marital_status',
		'mother_name',
		'father_name',
		'mother_contact',
		'father_contact',
		'birth_date',
		'BI_number',
		'BI_expiration_date',
		'email',
		'contact',
		'nationality_id',
		'profile_picture'
	];

	public function users()
	{
		return $this->hasMany(User::class);
	}
}
