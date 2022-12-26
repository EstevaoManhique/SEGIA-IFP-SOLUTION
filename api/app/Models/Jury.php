<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jury extends Model
{
    use HasFactory;
    protected $table = 'jurys';

    protected $fillable = [
		'course',
    'ifpcode'
    ];

    public function candidates()
	{
		return $this->hasMany(Candidate::class);
	}
}