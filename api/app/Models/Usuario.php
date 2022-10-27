<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Usuario
 * 
 * @property int $usua_id
 * @property bool $encrypted
 * @property Carbon|null $usu_dataUltimaVisita
 * @property string|null $usua_codigoRegistro
 * @property Carbon|null $usua_dataValidade
 * @property string|null $usua_device
 * @property string|null $usua_distrito
 * @property string|null $usua_estado
 * @property string|null $usua_fotoperfil
 * @property string|null $usua_online
 * @property string|null $usua_perguntaSeguranca
 * @property bool $usua_presenca
 * @property string|null $usua_provincia
 * @property string|null $usua_respostaSeguranca
 * @property string|null $usua_senha
 * @property string|null $usua_status
 * @property string|null $usua_statusicon
 * @property int|null $usua_tentativasLogin
 * @property string|null $usua_ultimasPasswords
 * @property string|null $usua_usuario
 * @property int|null $entidade_enti_id
 * @property int|null $escola_esc_id
 * @property int|null $pessoapess_pess_id
 * @property int|null $tipoUsuariotipu_tipu_id
 * 
 * @property Entidade|null $entidade
 * @property Pessoa|null $pessoa
 * @property Escola|null $escola
 * @property Tipousuario|null $tipousuario
 * @property Collection|Adenda[] $adendas
 * @property Collection|Browser[] $browsers
 * @property Collection|Caixa[] $caixas
 * @property Collection|Contacorrente[] $contacorrentes
 * @property Collection|Despesa[] $despesas
 * @property Collection|Doc[] $docs
 * @property Collection|Factura[] $facturas
 * @property Collection|Fecho[] $fechos
 * @property Collection|Fluxo[] $fluxos
 * @property Collection|Guiaremessa[] $guiaremessas
 * @property Collection|Lancamento[] $lancamentos
 * @property Collection|Lembrete[] $lembretes
 * @property Collection|Log[] $logs
 * @property Collection|Modulosusuario[] $modulosusuarios
 * @property Collection|Modulosusuariomarket[] $modulosusuariomarkets
 * @property Collection|Modulousuario[] $modulousuarios
 * @property Collection|Movimento[] $movimentos
 * @property Collection|Periodosalarial[] $periodosalarials
 * @property Collection|Petycash[] $petycashes
 * @property Collection|Requisicaocheque[] $requisicaocheques
 * @property Collection|Requisicaofundo[] $requisicaofundos
 *
 * @package App\Models
 */
class Usuario extends Model
{
	protected $table = 'usuario';
	protected $primaryKey = 'usua_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'usua_presenca' => 'bool',
		'usua_tentativasLogin' => 'int',
		'entidade_enti_id' => 'int',
		'escola_esc_id' => 'int',
		'pessoapess_pess_id' => 'int',
		'tipoUsuariotipu_tipu_id' => 'int'
	];

	protected $dates = [
		'usu_dataUltimaVisita',
		'usua_dataValidade'
	];

	protected $fillable = [
		'encrypted',
		'usu_dataUltimaVisita',
		'usua_codigoRegistro',
		'usua_dataValidade',
		'usua_device',
		'usua_distrito',
		'usua_estado',
		'usua_fotoperfil',
		'usua_online',
		'usua_perguntaSeguranca',
		'usua_presenca',
		'usua_provincia',
		'usua_respostaSeguranca',
		'usua_senha',
		'usua_status',
		'usua_statusicon',
		'usua_tentativasLogin',
		'usua_ultimasPasswords',
		'usua_usuario',
		'entidade_enti_id',
		'escola_esc_id',
		'pessoapess_pess_id',
		'tipoUsuariotipu_tipu_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function pessoa()
	{
		return $this->belongsTo(Pessoa::class, 'pessoapess_pess_id');
	}

	public function escola()
	{
		return $this->belongsTo(Escola::class, 'escola_esc_id');
	}

	public function tipousuario()
	{
		return $this->belongsTo(Tipousuario::class, 'tipoUsuariotipu_tipu_id');
	}

	public function adendas()
	{
		return $this->hasMany(Adenda::class, 'usuario_usua_id');
	}

	public function browsers()
	{
		return $this->hasMany(Browser::class, 'usuario_usua_id');
	}

	public function caixas()
	{
		return $this->hasMany(Caixa::class, 'usuario_usua_id');
	}

	public function contacorrentes()
	{
		return $this->hasMany(Contacorrente::class, 'usuario_usua_id');
	}

	public function despesas()
	{
		return $this->hasMany(Despesa::class, 'usuario_usua_id');
	}

	public function docs()
	{
		return $this->hasMany(Doc::class, 'usuario_usua_id');
	}

	public function facturas()
	{
		return $this->hasMany(Factura::class, 'usuario_usua_id');
	}

	public function fechos()
	{
		return $this->hasMany(Fecho::class, 'usuario_usua_id');
	}

	public function fluxos()
	{
		return $this->hasMany(Fluxo::class, 'usuario_usua_id');
	}

	public function guiaremessas()
	{
		return $this->hasMany(Guiaremessa::class, 'usuario_usua_id');
	}

	public function lancamentos()
	{
		return $this->hasMany(Lancamento::class, 'usuario_usua_id');
	}

	public function lembretes()
	{
		return $this->hasMany(Lembrete::class, 'usuario_usua_id');
	}

	public function logs()
	{
		return $this->hasMany(Log::class, 'usuario_usua_id');
	}

	public function modulosusuarios()
	{
		return $this->hasMany(Modulosusuario::class, 'usuario_usua_id');
	}

	public function modulosusuariomarkets()
	{
		return $this->hasMany(Modulosusuariomarket::class, 'usuario_usua_id');
	}

	public function modulousuarios()
	{
		return $this->hasMany(Modulousuario::class, 'usuario_usua_id');
	}

	public function movimentos()
	{
		return $this->hasMany(Movimento::class, 'usuario_usua_id');
	}

	public function periodosalarials()
	{
		return $this->hasMany(Periodosalarial::class, 'usuarioAutoriza_usua_id');
	}

	public function petycashes()
	{
		return $this->hasMany(Petycash::class, 'usuario_usua_id');
	}

	public function requisicaocheques()
	{
		return $this->hasMany(Requisicaocheque::class, 'usuario_usua_id');
	}

	public function requisicaofundos()
	{
		return $this->hasMany(Requisicaofundo::class, 'usuario3_usua_id');
	}
}
