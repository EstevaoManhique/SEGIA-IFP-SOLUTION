<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdministracaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('administracao', function (Blueprint $table) {
            $table->integer('adm_id', true);
            $table->string('adm_nome')->nullable();
            $table->boolean('encrypted');
            $table->integer('empresa_enti_id')->nullable()->index('FK_aew1eoj0u4en2ssyeipyc74g0');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('administracao');
    }
}
