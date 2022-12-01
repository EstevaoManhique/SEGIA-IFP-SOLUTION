<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ClassCategory
 *
 * @property int $id
 * @property string|null $cod
 * @property string|null $description
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class ClassCategory extends Model
{
    protected $table = 'class_categories';

    protected $fillable = [
        'cod',
        'description'
    ];
}
