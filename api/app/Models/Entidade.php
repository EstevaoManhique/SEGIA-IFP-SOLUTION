<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Entidade
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
 * @property Collection|Actum[] $acta
 * @property Collection|Activo[] $activos
 * @property Collection|Adenda[] $adendas
 * @property Collection|Administracao[] $administracaos
 * @property Collection|Agenda[] $agendas
 * @property Collection|Agendacontacto[] $agendacontactos
 * @property Collection|Aluno[] $alunos
 * @property Collection|Anolectivo[] $anolectivos
 * @property Collection|Area[] $areas
 * @property Collection|Areaformacao[] $areaformacaos
 * @property Collection|Assiduidade[] $assiduidades
 * @property Collection|Avaliacao[] $avaliacaos
 * @property Collection|Banco[] $bancos
 * @property Collection|Boletim[] $boletims
 * @property Collection|Caixa[] $caixas
 * @property Collection|Calendario[] $calendarios
 * @property Collection|Calendarioexame[] $calendarioexames
 * @property Collection|Cargo[] $cargos
 * @property Collection|Categorium[] $categoria
 * @property Collection|Categoriaproduto[] $categoriaprodutos
 * @property Collection|Cliente[] $clientes
 * @property Collection|Codigo[] $codigos
 * @property Collection|Condicaopagamento[] $condicaopagamentos
 * @property Collection|Contum[] $conta
 * @property Collection|Contacorrente[] $contacorrentes
 * @property Collection|Contageral[] $contagerals
 * @property Collection|Contracto[] $contractos
 * @property Collection|Contrato[] $contratos
 * @property Collection|Convocado[] $convocados
 * @property Collection|Convocatorium[] $convocatoria
 * @property Collection|Curso[] $cursos
 * @property Collection|Departamento[] $departamentos
 * @property Collection|Dependente[] $dependentes
 * @property Collection|Despesa[] $despesas
 * @property Collection|Diario[] $diarios
 * @property Collection|Disciplina[] $disciplinas
 * @property Collection|Disciplinacurso[] $disciplinacursos
 * @property Collection|Disciplinadocente[] $disciplinadocentes
 * @property Collection|Doc[] $docs
 * @property Collection|Docente[] $docentes
 * @property Collection|Docenteturma[] $docenteturmas
 * @property Collection|Documento[] $documentos
 * @property Collection|Exame[] $exames
 * @property Collection|Extracto[] $extractos
 * @property Collection|Extractocontageral[] $extractocontagerals
 * @property Collection|Factura[] $facturas
 * @property Collection|Falta[] $faltas
 * @property Collection|Fecho[] $fechos
 * @property Collection|Feria[] $ferias
 * @property Collection|Firma[] $firmas
 * @property Collection|Fluxo[] $fluxos
 * @property Collection|Folhasalarial[] $folhasalarials
 * @property Collection|Formacao[] $formacaos
 * @property Collection|Fornecedor[] $fornecedors
 * @property Collection|Funcionario[] $funcionarios
 * @property Collection|Guiaremessa[] $guiaremessas
 * @property Collection|Habilitacao[] $habilitacaos
 * @property Collection|Horario[] $horarios
 * @property Collection|Hora[] $horas
 * @property Collection|Inscricao[] $inscricaos
 * @property Collection|Isencao[] $isencaos
 * @property Collection|Itempedido[] $itempedidos
 * @property Collection|Itemrequisicao[] $itemrequisicaos
 * @property Collection|Itemrequisicaocheque[] $itemrequisicaocheques
 * @property Collection|Lancamento[] $lancamentos
 * @property Collection|Lembrete[] $lembretes
 * @property Collection|Listatelefonica[] $listatelefonicas
 * @property Collection|Log[] $logs
 * @property Collection|Medium[] $media
 * @property Collection|Meiopagamento[] $meiopagamentos
 * @property Collection|Mensalidade[] $mensalidades
 * @property Collection|Modulo[] $modulos
 * @property Collection|Moduloacesso[] $moduloacessos
 * @property Collection|Modulosusuario[] $modulosusuarios
 * @property Collection|Modulosusuariomarket[] $modulosusuariomarkets
 * @property Collection|Moeda[] $moedas
 * @property Collection|Movimento[] $movimentos
 * @property Collection|Nivelacesso[] $nivelacessos
 * @property Collection|Nota[] $notas
 * @property Collection|Pagamento[] $pagamentos
 * @property Collection|Parceiro[] $parceiros
 * @property Collection|Pdf[] $pdfs
 * @property Collection|Periodosalarial[] $periodosalarials
 * @property Collection|Pessoa[] $pessoas
 * @property Collection|Pety[] $peties
 * @property Collection|Petycash[] $petycashes
 * @property Collection|Planodecontum[] $planodeconta
 * @property Collection|Planosaude[] $planosaudes
 * @property Collection|Preco[] $precos
 * @property Collection|Presenca[] $presencas
 * @property Collection|Produto[] $produtos
 * @property Collection|Produtorequisicao[] $produtorequisicaos
 * @property Collection|Produtovendido[] $produtovendidos
 * @property Collection|Recibo[] $recibos
 * @property Collection|Recibopagamento[] $recibopagamentos
 * @property Collection|Registofecho[] $registofechos
 * @property Collection|Requisicao[] $requisicaos
 * @property Collection|Requisicaocheque[] $requisicaocheques
 * @property Collection|Requisicaofundo[] $requisicaofundos
 * @property Collection|Requisicaomaterial[] $requisicaomaterials
 * @property Collection|Respostum[] $resposta
 * @property Collection|Sala[] $salas
 * @property Collection|Salaexame[] $salaexames
 * @property Collection|Sector[] $sectors
 * @property Collection|Segmento[] $segmentos
 * @property Collection|Servico[] $servicos
 * @property Collection|Servicovendido[] $servicovendidos
 * @property Collection|Sumario[] $sumarios
 * @property Collection|Tamanho[] $tamanhos
 * @property Collection|Taxon[] $taxa
 * @property Collection|Tema[] $temas
 * @property Collection|Tipocontum[] $tipoconta
 * @property Collection|Tipodespesa[] $tipodespesas
 * @property Collection|Tipomovimentocheque[] $tipomovimentocheques
 * @property Collection|Tipopagamento[] $tipopagamentos
 * @property Collection|Tiposervico[] $tiposervicos
 * @property Collection|Transferencium[] $transferencia
 * @property Collection|Trial[] $trials
 * @property Collection|Turma[] $turmas
 * @property Collection|Turno[] $turnos
 * @property Collection|Upload[] $uploads
 * @property Collection|Usuario[] $usuarios
 * @property Collection|Vaga[] $vagas
 * @property Collection|Venda[] $vendas
 *
 * @package App\Models
 */
class Entidade extends Model
{
	protected $table = 'entidade';
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

	public function acta()
	{
		return $this->hasMany(Actum::class, 'entidade_enti_id');
	}

	public function activos()
	{
		return $this->hasMany(Activo::class, 'entidade_enti_id');
	}

	public function adendas()
	{
		return $this->hasMany(Adenda::class, 'entidade_enti_id');
	}

	public function administracaos()
	{
		return $this->hasMany(Administracao::class, 'empresa_enti_id');
	}

	public function agendas()
	{
		return $this->hasMany(Agenda::class, 'entidade_enti_id');
	}

	public function agendacontactos()
	{
		return $this->hasMany(Agendacontacto::class, 'entidade_enti_id');
	}

	public function alunos()
	{
		return $this->hasMany(Aluno::class, 'entidade_enti_id');
	}

	public function anolectivos()
	{
		return $this->hasMany(Anolectivo::class, 'entidade_enti_id');
	}

	public function areas()
	{
		return $this->hasMany(Area::class, 'entidade_enti_id');
	}

	public function areaformacaos()
	{
		return $this->hasMany(Areaformacao::class, 'entidade_enti_id');
	}

	public function assiduidades()
	{
		return $this->hasMany(Assiduidade::class, 'Entidade_enti_id');
	}

	public function avaliacaos()
	{
		return $this->hasMany(Avaliacao::class, 'entidade_enti_id');
	}

	public function bancos()
	{
		return $this->hasMany(Banco::class, 'entidade_enti_id');
	}

	public function boletims()
	{
		return $this->hasMany(Boletim::class, 'entidade_enti_id');
	}

	public function caixas()
	{
		return $this->hasMany(Caixa::class, 'entidade_enti_id');
	}

	public function calendarios()
	{
		return $this->hasMany(Calendario::class, 'entidade_enti_id');
	}

	public function calendarioexames()
	{
		return $this->hasMany(Calendarioexame::class, 'entidade_enti_id');
	}

	public function cargos()
	{
		return $this->hasMany(Cargo::class, 'Entidade_enti_id');
	}

	public function categoria()
	{
		return $this->hasMany(Categorium::class, 'entidade_enti_id');
	}

	public function categoriaprodutos()
	{
		return $this->hasMany(Categoriaproduto::class, 'Entidade_enti_id');
	}

	public function clientes()
	{
		return $this->hasMany(Cliente::class, 'Entidade_enti_id');
	}

	public function codigos()
	{
		return $this->hasMany(Codigo::class, 'entidade_enti_id');
	}

	public function condicaopagamentos()
	{
		return $this->hasMany(Condicaopagamento::class, 'entidade_enti_id');
	}

	public function conta()
	{
		return $this->hasMany(Contum::class, 'entidade_enti_id');
	}

	public function contacorrentes()
	{
		return $this->hasMany(Contacorrente::class, 'entidade_enti_id');
	}

	public function contagerals()
	{
		return $this->hasMany(Contageral::class, 'entidade_enti_id');
	}

	public function contractos()
	{
		return $this->hasMany(Contracto::class, 'Entidade_enti_id');
	}

	public function contratos()
	{
		return $this->hasMany(Contrato::class, 'entidade_enti_id');
	}

	public function convocados()
	{
		return $this->hasMany(Convocado::class, 'entidade_enti_id');
	}

	public function convocatoria()
	{
		return $this->hasMany(Convocatorium::class, 'entidade_enti_id');
	}

	public function cursos()
	{
		return $this->hasMany(Curso::class, 'entidade_enti_id');
	}

	public function departamentos()
	{
		return $this->hasMany(Departamento::class, 'Entidade_enti_id');
	}

	public function dependentes()
	{
		return $this->hasMany(Dependente::class, 'Entidade_enti_id');
	}

	public function despesas()
	{
		return $this->hasMany(Despesa::class, 'Entidade_enti_id');
	}

	public function diarios()
	{
		return $this->hasMany(Diario::class, 'entidade_enti_id');
	}

	public function disciplinas()
	{
		return $this->hasMany(Disciplina::class, 'entidade_enti_id');
	}

	public function disciplinacursos()
	{
		return $this->hasMany(Disciplinacurso::class, 'entidade_enti_id');
	}

	public function disciplinadocentes()
	{
		return $this->hasMany(Disciplinadocente::class, 'entidade_enti_id');
	}

	public function docs()
	{
		return $this->hasMany(Doc::class, 'entidade_enti_id');
	}

	public function docentes()
	{
		return $this->hasMany(Docente::class, 'entidade_enti_id');
	}

	public function docenteturmas()
	{
		return $this->hasMany(Docenteturma::class, 'entidade_enti_id');
	}

	public function documentos()
	{
		return $this->hasMany(Documento::class, 'entidade_enti_id');
	}

	public function exames()
	{
		return $this->hasMany(Exame::class, 'entidade_enti_id');
	}

	public function extractos()
	{
		return $this->hasMany(Extracto::class, 'entidade_enti_id');
	}

	public function extractocontagerals()
	{
		return $this->hasMany(Extractocontageral::class, 'entidade_enti_id');
	}

	public function facturas()
	{
		return $this->hasMany(Factura::class, 'Entidade_enti_id');
	}

	public function faltas()
	{
		return $this->hasMany(Falta::class, 'Entidade_enti_id');
	}

	public function fechos()
	{
		return $this->hasMany(Fecho::class, 'entidade_enti_id');
	}

	public function ferias()
	{
		return $this->hasMany(Feria::class, 'Entidade_enti_id');
	}

	public function firmas()
	{
		return $this->hasMany(Firma::class, 'entidade_enti_id');
	}

	public function fluxos()
	{
		return $this->hasMany(Fluxo::class, 'entidade_enti_id');
	}

	public function folhasalarials()
	{
		return $this->hasMany(Folhasalarial::class, 'entidade_enti_id');
	}

	public function formacaos()
	{
		return $this->hasMany(Formacao::class, 'Entidade_enti_id');
	}

	public function fornecedors()
	{
		return $this->hasMany(Fornecedor::class, 'entidade_enti_id');
	}

	public function funcionarios()
	{
		return $this->hasMany(Funcionario::class, 'Entidade_enti_id');
	}

	public function guiaremessas()
	{
		return $this->hasMany(Guiaremessa::class, 'entidade_enti_id');
	}

	public function habilitacaos()
	{
		return $this->hasMany(Habilitacao::class, 'Entidade_enti_id');
	}

	public function horarios()
	{
		return $this->hasMany(Horario::class, 'entidade_enti_id');
	}

	public function horas()
	{
		return $this->hasMany(Hora::class, 'Entidade_enti_id');
	}

	public function inscricaos()
	{
		return $this->hasMany(Inscricao::class, 'entidade_enti_id');
	}

	public function isencaos()
	{
		return $this->hasMany(Isencao::class, 'entidade_enti_id');
	}

	public function itempedidos()
	{
		return $this->hasMany(Itempedido::class, 'entidade_enti_id');
	}

	public function itemrequisicaos()
	{
		return $this->hasMany(Itemrequisicao::class, 'entidade_enti_id');
	}

	public function itemrequisicaocheques()
	{
		return $this->hasMany(Itemrequisicaocheque::class, 'entidade_enti_id');
	}

	public function lancamentos()
	{
		return $this->hasMany(Lancamento::class, 'entidade_enti_id');
	}

	public function lembretes()
	{
		return $this->hasMany(Lembrete::class, 'entidade_enti_id');
	}

	public function listatelefonicas()
	{
		return $this->hasMany(Listatelefonica::class, 'entidade_enti_id');
	}

	public function logs()
	{
		return $this->hasMany(Log::class, 'entidade_enti_id');
	}

	public function media()
	{
		return $this->hasMany(Medium::class, 'entidade_enti_id');
	}

	public function meiopagamentos()
	{
		return $this->hasMany(Meiopagamento::class, 'entidade_enti_id');
	}

	public function mensalidades()
	{
		return $this->hasMany(Mensalidade::class, 'entidade_enti_id');
	}

	public function modulos()
	{
		return $this->hasMany(Modulo::class, 'entidade_enti_id');
	}

	public function moduloacessos()
	{
		return $this->hasMany(Moduloacesso::class, 'entidadeenti_enti_id');
	}

	public function modulosusuarios()
	{
		return $this->hasMany(Modulosusuario::class, 'entidade_enti_id');
	}

	public function modulosusuariomarkets()
	{
		return $this->hasMany(Modulosusuariomarket::class, 'entidade_enti_id');
	}

	public function moedas()
	{
		return $this->hasMany(Moeda::class, 'entidade_enti_id');
	}

	public function movimentos()
	{
		return $this->hasMany(Movimento::class, 'entidade_enti_id');
	}

	public function nivelacessos()
	{
		return $this->hasMany(Nivelacesso::class, 'entidade_enti_id');
	}

	public function notas()
	{
		return $this->hasMany(Nota::class, 'entidade_enti_id');
	}

	public function pagamentos()
	{
		return $this->hasMany(Pagamento::class, 'entidade_enti_id');
	}

	public function parceiros()
	{
		return $this->hasMany(Parceiro::class, 'entidade_enti_id');
	}

	public function pdfs()
	{
		return $this->hasMany(Pdf::class, 'entidade_enti_id');
	}

	public function periodosalarials()
	{
		return $this->hasMany(Periodosalarial::class, 'entidade_enti_id');
	}

	public function pessoas()
	{
		return $this->hasMany(Pessoa::class, 'entidade_enti_id');
	}

	public function peties()
	{
		return $this->hasMany(Pety::class, 'entidade_enti_id');
	}

	public function petycashes()
	{
		return $this->hasMany(Petycash::class, 'entidade_enti_id');
	}

	public function planodeconta()
	{
		return $this->hasMany(Planodecontum::class, 'entidade_enti_id');
	}

	public function planosaudes()
	{
		return $this->hasMany(Planosaude::class, 'Entidade_enti_id');
	}

	public function precos()
	{
		return $this->hasMany(Preco::class, 'entidade_enti_id');
	}

	public function presencas()
	{
		return $this->hasMany(Presenca::class, 'entidade_enti_id');
	}

	public function produtos()
	{
		return $this->hasMany(Produto::class, 'Entidade_enti_id');
	}

	public function produtorequisicaos()
	{
		return $this->hasMany(Produtorequisicao::class, 'Entidade_enti_id');
	}

	public function produtovendidos()
	{
		return $this->hasMany(Produtovendido::class, 'Entidade_enti_id');
	}

	public function recibos()
	{
		return $this->hasMany(Recibo::class, 'entidade_enti_id');
	}

	public function recibopagamentos()
	{
		return $this->hasMany(Recibopagamento::class, 'entidade_enti_id');
	}

	public function registofechos()
	{
		return $this->hasMany(Registofecho::class, 'entidade_enti_id');
	}

	public function requisicaos()
	{
		return $this->hasMany(Requisicao::class, 'entidade_enti_id');
	}

	public function requisicaocheques()
	{
		return $this->hasMany(Requisicaocheque::class, 'entidade_enti_id');
	}

	public function requisicaofundos()
	{
		return $this->hasMany(Requisicaofundo::class, 'entidade_enti_id');
	}

	public function requisicaomaterials()
	{
		return $this->hasMany(Requisicaomaterial::class, 'entidade_enti_id');
	}

	public function resposta()
	{
		return $this->hasMany(Respostum::class, 'entidade_enti_id');
	}

	public function salas()
	{
		return $this->hasMany(Sala::class, 'entidade_enti_id');
	}

	public function salaexames()
	{
		return $this->hasMany(Salaexame::class, 'entidade_enti_id');
	}

	public function sectors()
	{
		return $this->hasMany(Sector::class, 'Entidade_enti_id');
	}

	public function segmentos()
	{
		return $this->hasMany(Segmento::class, 'entidade_enti_id');
	}

	public function servicos()
	{
		return $this->hasMany(Servico::class, 'entidade_enti_id');
	}

	public function servicovendidos()
	{
		return $this->hasMany(Servicovendido::class, 'entidade_enti_id');
	}

	public function sumarios()
	{
		return $this->hasMany(Sumario::class, 'entidade_enti_id');
	}

	public function tamanhos()
	{
		return $this->hasMany(Tamanho::class, 'entidade_enti_id');
	}

	public function taxa()
	{
		return $this->hasMany(Taxon::class, 'entidade_enti_id');
	}

	public function temas()
	{
		return $this->hasMany(Tema::class, 'entidade_enti_id');
	}

	public function tipoconta()
	{
		return $this->hasMany(Tipocontum::class, 'entidade_enti_id');
	}

	public function tipodespesas()
	{
		return $this->hasMany(Tipodespesa::class, 'Entidade_enti_id');
	}

	public function tipomovimentocheques()
	{
		return $this->hasMany(Tipomovimentocheque::class, 'entidade_enti_id');
	}

	public function tipopagamentos()
	{
		return $this->hasMany(Tipopagamento::class, 'entidade_enti_id');
	}

	public function tiposervicos()
	{
		return $this->hasMany(Tiposervico::class, 'entidade_enti_id');
	}

	public function transferencia()
	{
		return $this->hasMany(Transferencium::class, 'entidade2_enti_id');
	}

	public function trials()
	{
		return $this->hasMany(Trial::class, 'entidade_enti_id');
	}

	public function turmas()
	{
		return $this->hasMany(Turma::class, 'entidade_enti_id');
	}

	public function turnos()
	{
		return $this->hasMany(Turno::class, 'entidade_enti_id');
	}

	public function uploads()
	{
		return $this->hasMany(Upload::class, 'entidade_enti_id');
	}

	public function usuarios()
	{
		return $this->hasMany(Usuario::class, 'entidade_enti_id');
	}

	public function vagas()
	{
		return $this->hasMany(Vaga::class, 'entidade_enti_id');
	}

	public function vendas()
	{
		return $this->hasMany(Venda::class, 'Entidade_enti_id');
	}
}
