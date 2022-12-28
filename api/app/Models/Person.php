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
 * @property string|null $father_workstation
 * @property string|null $mother_workstation
 * @property string|null $father_work
 * @property string|null $mother_work
 * @property Carbon|null $birth_date
 * @property string|null $doc_type
 * @property string|null $BI_number
 * @property Carbon|null $BI_expiration_date
 * @property Carbon|null $BI_issue_date
 * @property string|null $nuit
 * @property string|null $email
 * @property string|null $contact
 * @property int|null $nationality_id
 * @property string|null $profile_picture
 * @property string|null $cPostal
 * @property string|null $city
 * @property string|null $district
 * @property string|null $province
 * @property string|null $numero_casa
 * @property string|null $address
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property Collection|Student[] $students
 * @property Collection|Teacher[] $teachers
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
		'BI_expiration_date',
		'BI_issue_date'
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
		'father_workstation',
		'mother_workstation',
		'father_work',
		'mother_work',
		'birth_date',
		'doc_type',
		'BI_number',
		'BI_expiration_date',
		'BI_issue_date',
		'nuit',
		'email',
		'contact',
		'nationality_id',
		'profile_picture',
		'cPostal',
		'city',
		'district',
		'province',
		'numero_casa',
		'address'
	];

	public function students()
	{
		return $this->hasMany(Student::class);
	}

	public function teachers()
	{
		return $this->hasMany(Teacher::class);
	}
}
