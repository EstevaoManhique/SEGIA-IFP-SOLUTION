<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class contact extends Model
{

    protected $table = 'contacts';

	protected $fillable = [
		'contact',
        'candidate_id'
    ];

    public function candidate()
    {
        return $this->belongsTo(Candidate::class);
    }

}
