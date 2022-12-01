<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSumarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sumario', function (Blueprint $table) {
            $table->integer('suma_id', true);
            $table->boolean('encrypted');
            $table->longText('suma_avaliacao')->nullable();
            $table->longText('suma_bibliografia')->nullable();
            $table->dateTime('suma_data')->nullable();
            $table->longText('suma_descricao')->nullable();
            $table->longText('suma_metodologia')->nullable();
            $table->longText('suma_objectivo')->nullable();
            $table->longText('suma_recursos')->nullable();
            $table->longText('suma_resumo')->nullable();
            $table->integer('curso_curs_id')->nullable()->index('FK_oecbiu66b904ef74s061oxqpb');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_2w0wkbh7ep11riawie9i7bpim');
            $table->integer('entidade_enti_id')->nullable()->index('FK_erkiyr7cye2qv80t10qrjhn9e');
            $table->integer('escola_esc_id')->nullable()->index('FK_2ye3jt4ejmc3bx0p8u58vobq7');
            $table->integer('tema_tema_id')->nullable()->index('FK_j66ial8ufj23ubel985dv03ne');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sumario');
    }
}
