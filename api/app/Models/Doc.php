<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Doc
 * 
 * @property int $doc_id
 * @property string|null $doc_assunto
 * @property Carbon|null $doc_data
 * @property Carbon|null $doc_dataDespacho
 * @property Carbon|null $doc_dataParecer
 * @property string|null $doc_despacho
 * @property string|null $doc_destinatario
 * @property string|null $doc_link
 * @property string|null $doc_parecer
 * @property string|null $doc_referencia
 * @property string|null $doc_status
 * @property string|null $doc_texto
 * @property string|null $doc_tipo
 * @property bool $encrypted
 * @property int|null $codigo_cod_id
 * @property int|null $departamento_dep_id
 * @property int|null $entidade_enti_id
 * @property int|null $escola_esc_id
 * @property int|null $usuario_usua_id
 * @property int|null $usuario2_usua_id
 * @property int|null $usuario3_usua_id
 * 
 * @property Departamento|null $departamento
 * @property Usuario|null $usuario
 * @property Entidade|null $entidade
 * @property Escola|null $escola
 * @property Codigo|null $codigo
 *
 * @package App\Models
 */
class Doc extends Model
{
	protected $table = 'doc';
	protected $primaryKey = 'doc_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'codigo_cod_id' => 'int',
		'departamento_dep_id' => 'int',
		'entidade_enti_id' => 'int',
		'escola_esc_id' => 'int',
		'usuario_usua_id' => 'int',
		'usuario2_usua_id' => 'int',
		'usuario3_usua_id' => 'int'
	];

	protected $dates = [
		'doc_data',
		'doc_dataDespacho',
		'doc_dataParecer'
	];

	protected $fillable = [
		'doc_assunto',
		'doc_data',
		'doc_dataDespacho',
		'doc_dataParecer',
		'doc_despacho',
		'doc_destinatario',
		'doc_link',
		'doc_parecer',
		'doc_referencia',
		'doc_status',
		'doc_texto',
		'doc_tipo',
		'encrypted',
		'codigo_cod_id',
		'departamento_dep_id',
		'entidade_enti_id',
		'escola_esc_id',
		'usuario_usua_id',
		'usuario2_usua_id',
		'usuario3_usua_id'
	];

	public function departamento()
	{
		return $this->belongsTo(Departamento::class, 'departamento_dep_id');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function escola()
	{
		return $this->belongsTo(Escola::class, 'escola_esc_id');
	}

	public function codigo()
	{
		return $this->belongsTo(Codigo::class, 'codigo_cod_id');
	}
}
