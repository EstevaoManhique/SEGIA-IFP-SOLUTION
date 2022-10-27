<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Pessoa
 * 
 * @property int $pess_id
 * @property bool $encrypted
 * @property string|null $pess_actividade
 * @property float|null $pess_altura
 * @property string|null $pess_apelido
 * @property string|null $pess_bairro
 * @property string|null $pess_bi
 * @property string|null $pess_cPostal
 * @property string|null $pess_cidade
 * @property string|null $pess_contacto
 * @property string|null $pess_contactoMae
 * @property string|null $pess_contactoPai
 * @property Carbon|null $pess_dataCadastro
 * @property string|null $pess_dataEmissaoBi
 * @property Carbon|null $pess_dataNascimento
 * @property string|null $pess_dataValidadeBi
 * @property string|null $pess_distrito
 * @property string|null $pess_documento
 * @property string|null $pess_educacao
 * @property string|null $pess_email
 * @property string|null $pess_estadoCivil
 * @property string|null $pess_foto
 * @property string|null $pess_generoActividae
 * @property string|null $pess_generoAlimentacao
 * @property string|null $pess_generoBebida
 * @property string|null $pess_generoCultura
 * @property string|null $pess_generoEntretenimento
 * @property string|null $pess_generoFilme
 * @property string|null $pess_generoMusica
 * @property string|null $pess_grauParentesco
 * @property string|null $pess_hobbie
 * @property string|null $pess_lingua
 * @property string|null $pess_localTrabalho
 * @property string|null $pess_nome
 * @property string|null $pess_nomeMae
 * @property string|null $pess_nomePai
 * @property string|null $pess_nuit
 * @property string|null $pess_numeroCasa
 * @property string|null $pess_origemRegisto
 * @property string|null $pess_pais
 * @property string|null $pess_profissaoMae
 * @property string|null $pess_profissaoPai
 * @property string|null $pess_provincia
 * @property string|null $pess_raca
 * @property string|null $pess_relegiao
 * @property string|null $pess_responsavel
 * @property string|null $pess_rua
 * @property string|null $pess_sector
 * @property string|null $pess_sexo
 * @property string|null $pess_sinais
 * @property string|null $pess_skills
 * @property string|null $pess_sobre
 * @property string|null $pess_tipo
 * @property string|null $pess_trabalhoMae
 * @property string|null $pess_trabalhoPai
 * @property string|null $pess_vicios
 * @property int|null $entidade_enti_id
 * @property int|null $nacionalidadenaci_naci_id
 * 
 * @property Entidade|null $entidade
 * @property Nacionalidade|null $nacionalidade
 * @property Collection|Aluno[] $alunos
 * @property Collection|Assiduidade[] $assiduidades
 * @property Collection|Cliente[] $clientes
 * @property Collection|Convocado[] $convocados
 * @property Collection|Convocatorium[] $convocatoria
 * @property Collection|Docente[] $docentes
 * @property Collection|Funcionario[] $funcionarios
 * @property Collection|Pagamento[] $pagamentos
 * @property Collection|Recibo[] $recibos
 * @property Collection|Recibopagamento[] $recibopagamentos
 * @property Collection|Requisicaomaterial[] $requisicaomaterials
 * @property Collection|Usuario[] $usuarios
 *
 * @package App\Models
 */
class Pessoa extends Model
{
	protected $table = 'pessoa';
	protected $primaryKey = 'pess_id';
	public $timestamps = false;

	protected $casts = [
		'encrypted' => 'bool',
		'pess_altura' => 'float',
		'entidade_enti_id' => 'int',
		'nacionalidadenaci_naci_id' => 'int'
	];

	protected $dates = [
		'pess_dataCadastro',
		'pess_dataNascimento'
	];

	protected $fillable = [
		'encrypted',
		'pess_actividade',
		'pess_altura',
		'pess_apelido',
		'pess_bairro',
		'pess_bi',
		'pess_cPostal',
		'pess_cidade',
		'pess_contacto',
		'pess_contactoMae',
		'pess_contactoPai',
		'pess_dataCadastro',
		'pess_dataEmissaoBi',
		'pess_dataNascimento',
		'pess_dataValidadeBi',
		'pess_distrito',
		'pess_documento',
		'pess_educacao',
		'pess_email',
		'pess_estadoCivil',
		'pess_foto',
		'pess_generoActividae',
		'pess_generoAlimentacao',
		'pess_generoBebida',
		'pess_generoCultura',
		'pess_generoEntretenimento',
		'pess_generoFilme',
		'pess_generoMusica',
		'pess_grauParentesco',
		'pess_hobbie',
		'pess_lingua',
		'pess_localTrabalho',
		'pess_nome',
		'pess_nomeMae',
		'pess_nomePai',
		'pess_nuit',
		'pess_numeroCasa',
		'pess_origemRegisto',
		'pess_pais',
		'pess_profissaoMae',
		'pess_profissaoPai',
		'pess_provincia',
		'pess_raca',
		'pess_relegiao',
		'pess_responsavel',
		'pess_rua',
		'pess_sector',
		'pess_sexo',
		'pess_sinais',
		'pess_skills',
		'pess_sobre',
		'pess_tipo',
		'pess_trabalhoMae',
		'pess_trabalhoPai',
		'pess_vicios',
		'entidade_enti_id',
		'nacionalidadenaci_naci_id'
	];

	public function entidade()
	{
		return $this->belongsTo(Entidade::class, 'entidade_enti_id');
	}

	public function nacionalidade()
	{
		return $this->belongsTo(Nacionalidade::class, 'nacionalidadenaci_naci_id');
	}

	public function alunos()
	{
		return $this->hasMany(Aluno::class, 'pessoa_pess_id');
	}

	public function assiduidades()
	{
		return $this->hasMany(Assiduidade::class, 'pessoa_pess_id');
	}

	public function clientes()
	{
		return $this->hasMany(Cliente::class, 'pessoapess_pess_id');
	}

	public function convocados()
	{
		return $this->hasMany(Convocado::class, 'pessoa_pess_id');
	}

	public function convocatoria()
	{
		return $this->hasMany(Convocatorium::class, 'secretario_pess_id');
	}

	public function docentes()
	{
		return $this->hasMany(Docente::class, 'pessoa_pess_id');
	}

	public function funcionarios()
	{
		return $this->hasMany(Funcionario::class, 'pessoapess_pess_id');
	}

	public function pagamentos()
	{
		return $this->hasMany(Pagamento::class, 'pessoa_pess_id');
	}

	public function recibos()
	{
		return $this->hasMany(Recibo::class, 'pessoa_pess_id');
	}

	public function recibopagamentos()
	{
		return $this->hasMany(Recibopagamento::class, 'pessoa_pess_id');
	}

	public function requisicaomaterials()
	{
		return $this->hasMany(Requisicaomaterial::class, 'pessoa_pess_id');
	}

	public function usuarios()
	{
		return $this->hasMany(Usuario::class, 'pessoapess_pess_id');
	}
}
