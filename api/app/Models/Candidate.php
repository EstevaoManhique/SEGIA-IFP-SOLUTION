<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


/**
 * Class Candidate
 *
 * @property int $id
 * @property string $nome
 * @property string $outrosNomes
 * @property int $contact_id
 * @property string $birth_date
 * @property string $identificacao
 * @property int $gender_id
 * @property int $district_id
 * @property int $school_id
 * @property int $course_id
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @property Province $province
 * @property Collection|School[] $schools
 *
 * @package App\Models
 */
class Candidate extends Model
{
    protected $table = 'candidates';

	protected $fillable = [
		'nome',
		'outrosNomes',
        'contact_id',
        'birth_date',
        'identificacao',
        'gender_id',
        'district_id',
        'school_id',
        'course_id'
    ];

    public function gender(){
        return $this->belongsTo(Gender::class);
    }

    public function district(){
        return $this->belongsTo(District::class);
    }

    public function province(){
        return $this->belongsTo(Province::class);
    }

    public function school(){
        return $this->belongsTo(School::class);
    }

    public function course(){
        return $this->belongsTo(Course::class);
    }

    public function avaliacao(){
        return $this->belongsTo(Avaliacao::class);
    }

    public function contacts()
	{
		return $this->hasMany(Contact::class);
	}

}