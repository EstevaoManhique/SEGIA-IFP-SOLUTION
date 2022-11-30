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
 * @property int $classe_category_id
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @property Collection|ClassSubject[] $class_subjects
 *
 * @package App\Models
 */
class Classe extends Model
{
    protected $table = 'classes';

    protected $casts = [
        'classe_category_id' => 'int'
    ];

    protected $fillable = [
        'cod',
        'description',
        'classe_category_id'
    ];

    public function class_subjects()
    {
        return $this->hasMany(ClassSubject::class);
    }
}
