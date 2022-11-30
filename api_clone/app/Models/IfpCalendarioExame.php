<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class IfpCalendarioExame
 * 
 * @property int $id_shedule_exam
 * @property string $description
 * @property Carbon|null $start_date
 * @property Carbon $end_date
 *
 * @package App\Models
 */
class IfpCalendarioExame extends Model
{
	protected $table = 'ifp_calendario_exames';
	protected $primaryKey = 'id';
	public $timestamps = false;

	protected $dates = [
		'start_date',
		'end_date'
	];

	protected $fillable = [
		'description',
		'start_date',
		'end_date'
	];
}
