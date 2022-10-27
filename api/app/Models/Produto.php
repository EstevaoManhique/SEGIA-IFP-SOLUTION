<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Produto
 * 
 * @property int $pro_id
 * @property bool $encrypted
 * @property string|null $pro_codigo
 * @property string|null $pro_codigo_barras
 * @property Carbon|null $pro_dataFabrico
 * @property Carbon|null $pro_dataValidade
 * @property string|null $pro_descriminacao
 * @property string|null $pro_detalhes
 * @property int $pro_estoque
 * @property string|null $pro_imagem
 * @property string|null $pro_marca
 * @property int $pro_margemAlarme
 * @property string|null $pro_nome
 * @property float $pro_preco
 * @property float $pro_preco2
 * @property float $pro_precoCompra
 * @property string|null $pro_segmento
 * @property int|null $Entidade_enti_id
 * @property int|null $categoriaProduto_catp_id
 * @property int|null $cor_cor_id
 * @property int|null $fornecedor_for_id
 * @property int|null $tamanho_tam_id
 * 
 * @property Fornecedor|null $fornecedor
 * @property Cor|null $cor
 * @property Entidade|null $entidade
 * @property Tamanho|null $tamanho
 * @property Categoriaproduto|null $categoriaproduto
 * @property Collection|Fluxo[] $fluxos
 * @property Collection|Produtorequisicao[] $produtorequisicaos
 * @property Collection|Produtovendido[] $produtovendidos
 * @property Collection|Registofecho[] $registofechos
 *
 * @package App\Models
 */
class Produto extends Model
{
	protected $table = 'produto';
	protected $primaryKey = 'pro_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'pro_estoque' => 'int',
		'pro_margemAlarme' => 'int',
		'pro_preco' => 'float',
		'pro_preco2' => 'float',
		'pro_precoCompra' => 'float',
		'Entidade_enti_id' => 'int',
		'categoriaProduto_catp_id' => 'int',
		'cor_cor_id' => 'int',
		'fornecedor_for_id' => 'int',
		'tamanho_tam_id' => 'int'
	];

	protected $dates = [
		'pro_dataFabrico',
		'pro_dataValidade'
	];

	protected $fillable = [
		'encrypted',
		'pro_codigo',
		'pro_codigo_barras',
		'pro_dataFabrico',
		'pro_dataValidade',
		'pro_descriminacao',
		'pro_detalhes',
		'pro_estoque',
		'pro_imagem',
		'pro_marca',
		'pro_margemAlarme',
		'pro_nome',
		'pro_preco',
		'pro_preco2',
		'pro_precoCompra',
		'pro_segmento',
		'Entidade_enti_id',
		'categoriaProduto_catp_id',
		'cor_cor_id',
		'fornecedor_for_id',
		'tamanho_tam_id'
	];

	public function fornecedor()
	{
		return $this->belongsTo(Fornecedor::class, 'fornecedor_for_id');
	}

	public function cor()
	{
		return $this->belongsTo(Cor::class, 'cor_cor_id');
	}

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'Entidade_enti_id');
	}

	public function tamanho()
	{
		return $this->belongsTo(Tamanho::class, 'tamanho_tam_id');
	}

	public function categoriaproduto()
	{
		return $this->belongsTo(Categoriaproduto::class, 'categoriaProduto_catp_id');
	}

	public function fluxos()
	{
		return $this->hasMany(Fluxo::class, 'produto_pro_id');
	}

	public function produtorequisicaos()
	{
		return $this->hasMany(Produtorequisicao::class, 'produto_pro_id');
	}

	public function produtovendidos()
	{
		return $this->hasMany(Produtovendido::class, 'produto_pro_id');
	}

	public function registofechos()
	{
		return $this->hasMany(Registofecho::class, 'produto_pro_id');
	}
}
