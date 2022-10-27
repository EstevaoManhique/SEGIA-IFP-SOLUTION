<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Lancamento
 * 
 * @property int $lan_id
 * @property bool $encrypted
 * @property Carbon|null $lan_data
 * @property string|null $lan_descricao
 * @property float $lan_iva
 * @property int $lan_numero
 * @property string|null $lan_operacao
 * @property string|null $lan_referencia
 * @property string|null $lan_referenciaDiario
 * @property string|null $lan_referenciaDocumento
 * @property string|null $lan_referenciaMovimento
 * @property float $lan_valor
 * @property int|null $contaCliente_ctg_id
 * @property int|null $contaPlano_ctg_id
 * @property int|null $diario_dir_id
 * @property int|null $documento_doc_id
 * @property int|null $entidade_enti_id
 * @property int|null $factura_fact_id
 * @property int|null $funcionario_func_id
 * @property int|null $usuario_usua_id
 * 
 * @property Diario|null $diario
 * @property Factura|null $factura
 * @property Funcionario|null $funcionario
 * @property Documento|null $documento
 * @property Contageral|null $contageral
 * @property Entidade|null $entidade
 * @property Usuario|null $usuario
 * @property Collection|Extractocontageral[] $extractocontagerals
 *
 * @package App\Models
 */
class Lancamento extends Model
{
	protected $table = 'lancamento';
	protected $primaryKey = 'lan_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'lan_iva' => 'float',
		'lan_numero' => 'int',
		'lan_valor' => 'float',
		'contaCliente_ctg_id' => 'int',
		'contaPlano_ctg_id' => 'int',
		'diario_dir_id' => 'int',
		'documento_doc_id' => 'int',
		'entidade_enti_id' => 'int',
		'factura_fact_id' => 'int',
		'funcionario_func_id' => 'int',
		'usuario_usua_id' => 'int'
	];

	protected $dates = [
		'lan_data'
	];

	protected $fillable = [
		'encrypted',
		'lan_data',
		'lan_descricao',
		'lan_iva',
		'lan_numero',
		'lan_operacao',
		'lan_referencia',
		'lan_referenciaDiario',
		'lan_referenciaDocumento',
		'lan_referenciaMovimento',
		'lan_valor',
		'contaCliente_ctg_id',
		'contaPlano_ctg_id',
		'diario_dir_id',
		'documento_doc_id',
		'entidade_enti_id',
		'factura_fact_id',
		'funcionario_func_id',
		'usuario_usua_id'
	];

	public function diario()
	{
		return $this->belongsTo(Diario::class, 'diario_dir_id');
	}

	public function factura()
	{
		return $this->belongsTo(Factura::class, 'factura_fact_id');
	}

	public function funcionario()
	{
		return $this->belongsTo(Funcionario::class, 'funcionario_func_id');
	}

	public function documento()
	{
		return $this->belongsTo(Documento::class, 'documento_doc_id');
	}

	public function contageral()
	{
		return $this->belongsTo(Contageral::class, 'contaPlano_ctg_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'usuario_usua_id');
	}

	public function extractocontagerals()
	{
		return $this->hasMany(Extractocontageral::class, 'lancamento_lan_id');
	}
}
