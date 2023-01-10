<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class School
 *
 * @property int $id
 * @property string|null $cod
 * @property string|null $name
 * @property string|null $abbreviation
 * @property int $district_id
 * @property string|null $type
 * @property bool $isCentro
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @property District $district
 * @property Collection|SchoolCategory[] $school_categories
 * @property Collection|Category[] $categories
 *
 * @package App\Models
 */
class School extends Model
{
    protected $table = 'schools';

    protected $casts = [
        'district_id' => 'int',
        'isCentro' => 'bool'
    ];

    protected $fillable = [
        'cod',
        'name',
        'abbreviation',
        'district_id',
        'type',
        'isCentro'
    ];

    public function district()
    {
        return $this->belongsTo(District::class);
    }

    public function school_categories()
    {
        return $this->hasMany(SchoolCategory::class);
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'school_categories')

            ->withTimestamps();
    }
}