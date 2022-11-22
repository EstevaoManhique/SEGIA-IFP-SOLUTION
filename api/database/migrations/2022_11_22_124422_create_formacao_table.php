<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormacaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('formacao', function (Blueprint $table) {
            $table->integer('frm_id', true);
            $table->boolean('encrypted');
            $table->integer('frm_cargahoraria');
            $table->dateTime('frm_dataconclusao')->nullable();
            $table->string('frm_descricao')->nullable();
            $table->string('frm_status')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_gik3tgutl9uodaf2q94scyv3g');
            $table->integer('funcionario_func_id')->nullable()->index('FK_p83i1d8a2jqrag3wv0hwjedrj');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('formacao');
    }
}
