<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToProdutorequisicaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('produtorequisicao', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_dpt8opp9wngpymymemi9vbjvf')->references(['enti_id'])->on('entidade');
            $table->foreign(['produto_pro_id'], 'FK_s3p36wffag6kuyhpkd7lt6buf')->references(['pro_id'])->on('produto');
            $table->foreign(['requisicaoMaterial_reqm_id'], 'FK_hw3o2yqbiowis42lgn131b1up')->references(['reqm_id'])->on('requisicaomaterial');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('produtorequisicao', function (Blueprint $table) {
            $table->dropForeign('FK_dpt8opp9wngpymymemi9vbjvf');
            $table->dropForeign('FK_s3p36wffag6kuyhpkd7lt6buf');
            $table->dropForeign('FK_hw3o2yqbiowis42lgn131b1up');
        });
    }
}
