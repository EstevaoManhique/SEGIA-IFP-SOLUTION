<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Class
 *
 * @property int $id
 * @property string|null $cod
 * @property string|null $description
 * @property int $category_id
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @property Category $category
 * @property Collection|Subject[] $subjects
 *
 * @package App\Models
 */
class Classe extends Model
{
    protected $table = 'classes';

    protected $casts = [
        'category_id' => 'int'
    ];

    protected $fillable = [
        'cod',
        'description',
        'category_id'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function subjects()
    {
        return $this->belongsToMany(Subject::class, 'class_subjects')
            ->withPivot('active')
            ->withTimestamps();
    }
}
