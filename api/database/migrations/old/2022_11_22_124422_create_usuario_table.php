<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsuarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuario', function (Blueprint $table) {
            $table->integer('usua_id', true);
            $table->boolean('encrypted');
            $table->dateTime('usu_dataUltimaVisita')->nullable();
            $table->string('usua_codigoRegistro')->nullable();
            $table->dateTime('usua_dataValidade')->nullable();
            $table->string('usua_device')->nullable();
            $table->string('usua_distrito')->nullable();
            $table->string('usua_estado')->nullable();
            $table->string('usua_fotoperfil')->nullable();
            $table->string('usua_online')->nullable();
            $table->string('usua_perguntaSeguranca')->nullable();
            $table->boolean('usua_presenca');
            $table->string('usua_provincia')->nullable();
            $table->string('usua_respostaSeguranca')->nullable();
            $table->string('usua_senha')->nullable();
            $table->string('usua_status')->nullable();
            $table->string('usua_statusicon')->nullable();
            $table->integer('usua_tentativasLogin')->nullable();
            $table->string('usua_ultimasPasswords')->nullable();
            $table->string('usua_usuario')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_5a5bibnjilke4mr7nkrmjticp');
            $table->integer('escola_esc_id')->nullable()->index('FK_7w82doj5vwuciq058t64vhhnc');
            $table->integer('pessoapess_pess_id')->nullable()->index('FK_68hgfkgf5x972ri2g7r4qsobw');
            $table->integer('tipoUsuariotipu_tipu_id')->nullable()->index('FK_edswmmi93y1eqnhfl9n4ecl4h');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('usuario');
    }
}
