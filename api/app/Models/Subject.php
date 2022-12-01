<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Subject
 *
 * @property int $id
 * @property string $name
 * @property Carbon $created_at
 * @property Carbon $update_at
 *
 * @property Collection|Classe[] $classes
 *
 * @package App\Models
 */
class Subject extends Model
{
    protected $table = 'subjects';
    public $timestamps = false;

    protected $dates = [
        'update_at'
    ];

    protected $fillable = [
        'name',
        'update_at'
    ];

    public function classes()
    {
        return $this->belongsToMany(Classe::class, 'class_subjects')
            ->withPivot('active')
            ->withTimestamps();
    }
}