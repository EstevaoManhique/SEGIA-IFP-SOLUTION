<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Avaliacao extends Model
{
    protected $table = 'avaliacoes';

	protected $fillable = [
		'portugues',
        'matematica',
        'entrevista'
    ];

    public function candidate(){
        return $this->belongsTo(Candidate::class);
    }
}
