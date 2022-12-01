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
 * @property  string $start_date
 * @property  string $end_date
 *
 * @package App\Models
 */
class IfpCalendarioExame extends Model
{
	protected $table = 'ifp_calendario_exames';
	protected $primaryKey = 'id';
	public $timestamps = false;

	protected $fillable = [
		'description',
		'start_date',
		'end_date'
	];
}
