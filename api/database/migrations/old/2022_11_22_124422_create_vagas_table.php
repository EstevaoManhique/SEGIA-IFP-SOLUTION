<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVagasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vagas', function (Blueprint $table) {
            $table->integer('vaga_id', true);
            $table->boolean('encrypted');
            $table->integer('vaga_preechidas');
            $table->integer('vaga_total');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_bvb17gjdvwvbvoeidoj2lxb5x');
            $table->integer('curso_curs_id')->nullable()->index('FK_imyyp6nj14hwetb2ug3fqf714');
            $table->integer('entidade_enti_id')->nullable()->index('FK_9la7tk47w1r4nd1gwd9kh7fd6');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vagas');
    }
}
