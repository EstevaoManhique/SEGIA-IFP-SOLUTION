<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Aproveitamento
 * 
 * @property int $apro_id
 * @property int $apro_admitidos
 * @property string|null $apro_ano
 * @property string|null $apro_categoria
 * @property int $apro_dispensados
 * @property int $apro_exames
 * @property int $apro_excluidos
 * @property int $apro_reprovados
 * @property string|null $cod_escola
 *
 * @package App\Models
 */
class Aproveitamento extends Model
{
	protected $table = 'aproveitamento';
	protected $primaryKey = 'apro_id';
	public $timestamps = false;

	protected $casts = [
		'apro_admitidos' => 'int',
		'apro_dispensados' => 'int',
		'apro_exames' => 'int',
		'apro_excluidos' => 'int',
		'apro_reprovados' => 'int'
	];

	protected $fillable = [
		'apro_admitidos',
		'apro_ano',
		'apro_categoria',
		'apro_dispensados',
		'apro_exames',
		'apro_excluidos',
		'apro_reprovados',
		'cod_escola'
	];
}
