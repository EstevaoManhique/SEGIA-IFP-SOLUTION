<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Pdf
 * 
 * @property int $pdf_id
 * @property bool $encrypted
 * @property Carbon|null $pdf_data
 * @property string|null $pdf_descricaoDocumento
 * @property string|null $pdf_hora
 * @property string|null $pdf_nomeDocumento
 * @property string|null $pdf_subPath
 * @property string|null $pdf_tipoDocumento
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 *
 * @package App\Models
 */
class Pdf extends Model
{
	protected $table = 'pdf';
	protected $primaryKey = 'pdf_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'entidade_enti_id' => 'int'
	];

	protected $dates = [
		'pdf_data'
	];

	protected $fillable = [
		'encrypted',
		'pdf_data',
		'pdf_descricaoDocumento',
		'pdf_hora',
		'pdf_nomeDocumento',
		'pdf_subPath',
		'pdf_tipoDocumento',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}
}
