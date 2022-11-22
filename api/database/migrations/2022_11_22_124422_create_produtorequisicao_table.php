<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProdutorequisicaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('produtorequisicao', function (Blueprint $table) {
            $table->integer('prr_id', true);
            $table->dateTime('prr_data')->nullable();
            $table->integer('prr_qtd');
            $table->string('prr_referencia')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_dpt8opp9wngpymymemi9vbjvf');
            $table->integer('produto_pro_id')->nullable()->index('FK_s3p36wffag6kuyhpkd7lt6buf');
            $table->integer('requisicaoMaterial_reqm_id')->nullable()->index('FK_hw3o2yqbiowis42lgn131b1up');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('produtorequisicao');
    }
}
