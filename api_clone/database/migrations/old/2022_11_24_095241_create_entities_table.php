<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEntitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('entities', function (Blueprint $table) {
            $table->integer('enti_id', true);
            $table->boolean('encrypted');
            $table->double('enti_capital');
            $table->string('enti_chaveSistema')->nullable();
            $table->string('enti_codigoPostal')->nullable();
            $table->string('enti_contactos1')->nullable();
            $table->string('enti_contactos2')->nullable();
            $table->string('enti_contactos3')->nullable();
            $table->dateTime('enti_dataFinalAssistencia')->nullable();
            $table->dateTime('enti_dataInicioAssitencia')->nullable();
            $table->string('enti_delegacao')->nullable();
            $table->string('enti_distrito')->nullable();
            $table->string('enti_dominio')->nullable();
            $table->string('enti_email')->nullable();
            $table->string('enti_endereco')->nullable();
            $table->string('enti_estadoSistema')->nullable();
            $table->string('enti_generoActividade')->nullable();
            $table->double('enti_iva');
            $table->string('enti_licenca')->nullable();
            $table->string('enti_linguaSistema')->nullable();
            $table->string('enti_logotipo')->nullable();
            $table->string('enti_macServidor')->nullable();
            $table->boolean('enti_newsletter');
            $table->string('enti_nome')->nullable();
            $table->string('enti_nuit')->nullable();
            $table->string('enti_pais')->nullable();
            $table->string('enti_pessoaContacto')->nullable();
            $table->string('enti_provincia')->nullable();
            $table->string('enti_sigla')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('entities');
    }
}
