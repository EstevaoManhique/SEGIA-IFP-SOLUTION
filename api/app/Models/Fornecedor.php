<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Fornecedor
 * 
 * @property int $for_id
 * @property bool $encrypted
 * @property string|null $for_contaGeral
 * @property string|null $for_contacto
 * @property string|null $for_email
 * @property string|null $for_endereco
 * @property string|null $for_nome
 * @property int $for_nuit
 * @property int|null $entidade_enti_id
 * 
 * @property Entidade|null $entidade
 * @property Collection|Activo[] $activos
 * @property Collection|Agendacontacto[] $agendacontactos
 * @property Collection|Guiaremessa[] $guiaremessas
 * @property Collection|Produto[] $produtos
 *
 * @package App\Models
 */
class Fornecedor extends Model
{
	protected $table = 'fornecedor';
	protected $primaryKey = 'for_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'for_nuit' => 'int',
		'entidade_enti_id' => 'int'
	];

	protected $fillable = [
		'encrypted',
		'for_contaGeral',
		'for_contacto',
		'for_email',
		'for_endereco',
		'for_nome',
		'for_nuit',
		'entidade_enti_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function activos()
	{
		return $this->hasMany(Activo::class, 'fornecedor_for_id');
	}

	public function agendacontactos()
	{
		return $this->hasMany(Agendacontacto::class, 'fornecedor_for_id');
	}

	public function guiaremessas()
	{
		return $this->hasMany(Guiaremessa::class, 'fornecedor_for_id');
	}

	public function produtos()
	{
		return $this->hasMany(Produto::class, 'fornecedor_for_id');
	}
}
