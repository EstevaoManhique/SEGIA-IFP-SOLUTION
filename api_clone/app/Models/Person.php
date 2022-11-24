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
 * @property string $surname
 * @property string $genre
 * @property string $marital_status
 * @property string $mother_name
 * @property string $father_name
 * @property string $mother_contact
 * @property string $father_contact
 * @property Carbon|null $birth_date
 * @property string $BI_number
 * @property Carbon|null $BI_expiration_date
 * @property string $email
 * @property string $contact
 * @property int $nationality_id
 * @property string|null $profile_picture
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property Collection|Student[] $students
 * @property Collection|Teacher[] $teachers
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

	public function students()
	{
		return $this->hasMany(Student::class);
	}

	public function teachers()
	{
		return $this->hasMany(Teacher::class);
	}

	public function users()
	{
		return $this->hasMany(User::class);
	}
}
