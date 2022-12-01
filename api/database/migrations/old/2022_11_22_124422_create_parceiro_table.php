<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateParceiroTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('parceiro', function (Blueprint $table) {
            $table->integer('parc_id', true);
            $table->boolean('encrypted');
            $table->string('parc_areaActuacao')->nullable();
            $table->string('parc_contacto')->nullable();
            $table->string('parc_descricao')->nullable();
            $table->string('parc_endereco')->nullable();
            $table->string('parc_nuit')->nullable();
            $table->string('parc_pessoaContacto')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_8xcy30fnj5f3aivlrebj77chw');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('parceiro');
    }
}
