<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDocenteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('docente', function (Blueprint $table) {
            $table->integer('doce_id', true);
            $table->boolean('doce_activo');
            $table->string('doce_categoria')->nullable();
            $table->string('doce_especialidade')->nullable();
            $table->string('doce_grauFormacao')->nullable();
            $table->string('doce_provincia')->nullable();
            $table->string('doce_senha')->nullable();
            $table->string('doce_tipoContrato')->nullable();
            $table->string('doce_usuario')->nullable();
            $table->dateTime('doce_validadeContrato')->nullable();
            $table->boolean('encrypted');
            $table->integer('areaFormacao_aref_id')->nullable()->index('FK_ataa0n6q7saq8j56lf0toywre');
            $table->integer('entidade_enti_id')->nullable()->index('FK_43lkif5xlit28rml5m1tdgr5a');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_qn8muyudxkb50x3vpnebqkrwi');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('docente');
    }
}
