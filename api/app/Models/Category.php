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
 * @property Collection|Classe[] $classes
 * @property SchoolClassCategory $school_class_category
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

    public function classes()
    {
        return $this->hasMany(Classe::class);
    }

    public function school_class_category()
    {
        return $this->hasOne(SchoolClassCategory::class, 'class_categorory_id');
    }
}