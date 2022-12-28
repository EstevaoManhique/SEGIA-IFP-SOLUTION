<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Category
 *
 * @property int $id
 * @property string|null $cod
 * @property string|null $description
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @property Collection|Course[] $courses
 * @property Collection|School[] $schools
 * @property Collection|SchoolCategory[] $school_categories
 *
 * @package App\Models
 */
class Category extends Model
{
    protected $table = 'categories';

    protected $fillable = [
        'cod',
        'description'
    ];

    public function courses()
    {
        return $this->hasMany(Course::class);
    }

    public function school_categories()
    {
        return $this->hasMany(SchoolCategory::class, 'categorory_id');
    }
    public function schools()
    {
        return $this->belongsToMany(School::class, 'school_categories')
            ->withTimestamps();
    }
}