<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateItemrequisicaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('itemrequisicao', function (Blueprint $table) {
            $table->integer('itr_id', true);
            $table->boolean('encrypted');
            $table->string('itr_descricao')->nullable();
            $table->integer('itr_qtd');
            $table->double('itr_valor');
            $table->integer('entidade_enti_id')->nullable()->index('FK_739knyv4nj73gyrsch0pt46ay');
            $table->integer('requisicao_req_id')->nullable()->index('FK_9lp4bpu7ge71o3033i0qh1woh');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('itemrequisicao');
    }
}
