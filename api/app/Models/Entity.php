<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Entity
 * 
 * @property int $enti_id
 * @property bool $encrypted
 * @property float $enti_capital
 * @property string|null $enti_chaveSistema
 * @property string|null $enti_codigoPostal
 * @property string|null $enti_contactos1
 * @property string|null $enti_contactos2
 * @property string|null $enti_contactos3
 * @property Carbon|null $enti_dataFinalAssistencia
 * @property Carbon|null $enti_dataInicioAssitencia
 * @property string|null $enti_delegacao
 * @property string|null $enti_distrito
 * @property string|null $enti_dominio
 * @property string|null $enti_email
 * @property string|null $enti_endereco
 * @property string|null $enti_estadoSistema
 * @property string|null $enti_generoActividade
 * @property float $enti_iva
 * @property string|null $enti_licenca
 * @property string|null $enti_linguaSistema
 * @property string|null $enti_logotipo
 * @property string|null $enti_macServidor
 * @property bool $enti_newsletter
 * @property string|null $enti_nome
 * @property string|null $enti_nuit
 * @property string|null $enti_pais
 * @property string|null $enti_pessoaContacto
 * @property string|null $enti_provincia
 * @property string|null $enti_sigla
 *
 * @package App\Models
 */
class Entity extends Model
{
	protected $table = 'entities';
	protected $primaryKey = 'enti_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'enti_capital' => 'float',
		'enti_iva' => 'float',
		'enti_newsletter' => 'bool'
	];

	protected $dates = [
		'enti_dataFinalAssistencia',
		'enti_dataInicioAssitencia'
	];

	protected $fillable = [
		'encrypted',
		'enti_capital',
		'enti_chaveSistema',
		'enti_codigoPostal',
		'enti_contactos1',
		'enti_contactos2',
		'enti_contactos3',
		'enti_dataFinalAssistencia',
		'enti_dataInicioAssitencia',
		'enti_delegacao',
		'enti_distrito',
		'enti_dominio',
		'enti_email',
		'enti_endereco',
		'enti_estadoSistema',
		'enti_generoActividade',
		'enti_iva',
		'enti_licenca',
		'enti_linguaSistema',
		'enti_logotipo',
		'enti_macServidor',
		'enti_newsletter',
		'enti_nome',
		'enti_nuit',
		'enti_pais',
		'enti_pessoaContacto',
		'enti_provincia',
		'enti_sigla'
	];
}
