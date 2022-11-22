<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePessoaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pessoa', function (Blueprint $table) {
            $table->integer('pess_id', true);
            $table->boolean('encrypted');
            $table->string('pess_actividade')->nullable();
            $table->float('pess_altura', 10, 0)->nullable();
            $table->string('pess_apelido')->nullable();
            $table->string('pess_bairro')->nullable();
            $table->string('pess_bi')->nullable();
            $table->string('pess_cPostal')->nullable();
            $table->string('pess_cidade')->nullable();
            $table->string('pess_contacto')->nullable();
            $table->string('pess_contactoMae')->nullable();
            $table->string('pess_contactoPai')->nullable();
            $table->dateTime('pess_dataCadastro')->nullable();
            $table->string('pess_dataEmissaoBi')->nullable();
            $table->dateTime('pess_dataNascimento')->nullable();
            $table->string('pess_dataValidadeBi')->nullable();
            $table->string('pess_distrito')->nullable();
            $table->string('pess_documento')->nullable();
            $table->string('pess_educacao')->nullable();
            $table->string('pess_email')->nullable();
            $table->string('pess_estadoCivil')->nullable();
            $table->string('pess_foto')->nullable();
            $table->string('pess_generoActividae')->nullable();
            $table->string('pess_generoAlimentacao')->nullable();
            $table->string('pess_generoBebida')->nullable();
            $table->string('pess_generoCultura')->nullable();
            $table->string('pess_generoEntretenimento')->nullable();
            $table->string('pess_generoFilme')->nullable();
            $table->string('pess_generoMusica')->nullable();
            $table->string('pess_grauParentesco')->nullable();
            $table->string('pess_hobbie')->nullable();
            $table->string('pess_lingua')->nullable();
            $table->string('pess_localTrabalho')->nullable();
            $table->string('pess_nome')->nullable();
            $table->string('pess_nomeMae')->nullable();
            $table->string('pess_nomePai')->nullable();
            $table->string('pess_nuit')->nullable();
            $table->string('pess_numeroCasa')->nullable();
            $table->string('pess_origemRegisto')->nullable();
            $table->string('pess_pais')->nullable();
            $table->string('pess_profissaoMae')->nullable();
            $table->string('pess_profissaoPai')->nullable();
            $table->string('pess_provincia')->nullable();
            $table->string('pess_raca')->nullable();
            $table->string('pess_relegiao')->nullable();
            $table->string('pess_responsavel')->nullable();
            $table->string('pess_rua')->nullable();
            $table->string('pess_sector')->nullable();
            $table->string('pess_sexo')->nullable();
            $table->string('pess_sinais')->nullable();
            $table->string('pess_skills')->nullable();
            $table->string('pess_sobre')->nullable();
            $table->string('pess_tipo')->nullable();
            $table->string('pess_trabalhoMae')->nullable();
            $table->string('pess_trabalhoPai')->nullable();
            $table->string('pess_vicios')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_nagwq4oa5q56x94iak41d0v3e');
            $table->integer('nacionalidadenaci_naci_id')->nullable()->index('FK_sgqnd7nxdd12e55k3xchh6m69');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pessoa');
    }
}
