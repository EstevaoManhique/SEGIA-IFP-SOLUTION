<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Questao extends Model
{

    protected $table = 'questoes';

	protected $fillable = [
		'resposta',
        'exam_id'
    ];
    public function exame(){
        return $this->belongsTo(Course::class);
    }

}
