<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Caixa
 * 
 * @property int $caix_id
 * @property string|null $caix_descricao
 * @property bool $encrypted
 * @property int|null $departamento_dep_id
 * @property int|null $entidade_enti_id
 * @property int|null $usuario_usua_id
 * 
 * @property Departamento|null $departamento
 * @property Usuario|null $usuario
 * @property Entidade|null $entidade
 * @property Collection|Factura[] $facturas
 * @property Collection|Pagamento[] $pagamentos
 *
 * @package App\Models
 */
class Caixa extends Model
{
	protected $table = 'caixa';
	protected $primaryKey = 'caix_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'departamento_dep_id' => 'int',
		'entidade_enti_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $fillable = [
		'caix_descricao',
		'encrypted',
		'departamento_dep_id',
		'entidade_enti_id',
		'usuario_usua_id'
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

	public function facturas()
	{
		return $this->hasMany(Factura::class, 'caixa_caix_id');
	}

	public function pagamentos()
	{
		return $this->hasMany(Pagamento::class, 'caixa_caix_id');
	}
}
