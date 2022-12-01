<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDocTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('doc', function (Blueprint $table) {
            $table->integer('doc_id', true);
            $table->longText('doc_assunto')->nullable();
            $table->dateTime('doc_data')->nullable();
            $table->dateTime('doc_dataDespacho')->nullable();
            $table->dateTime('doc_dataParecer')->nullable();
            $table->longText('doc_despacho')->nullable();
            $table->string('doc_destinatario')->nullable();
            $table->longText('doc_link')->nullable();
            $table->longText('doc_parecer')->nullable();
            $table->string('doc_referencia')->nullable();
            $table->string('doc_status')->nullable();
            $table->longText('doc_texto')->nullable();
            $table->string('doc_tipo')->nullable();
            $table->boolean('encrypted');
            $table->integer('codigo_cod_id')->nullable()->index('FK_tjdx0op0bm45fprc5ay9jkyaa');
            $table->integer('departamento_dep_id')->nullable()->index('FK_4qtl42972kex8o60r6voski7k');
            $table->integer('entidade_enti_id')->nullable()->index('FK_dhlomryq5ayjbncd0miomx8dy');
            $table->integer('escola_esc_id')->nullable()->index('FK_ldeks5i11tw7bqgs0m2v95lw0');
            $table->integer('usuario_usua_id')->nullable()->index('FK_qr4ly0f28e1x76b7jjitigub2');
            $table->integer('usuario2_usua_id')->nullable()->index('FK_5o947e57pp40bdkpy1y3cdq08');
            $table->integer('usuario3_usua_id')->nullable()->index('FK_lho08pgudxfeu30j095lhmu71');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('doc');
    }
}
