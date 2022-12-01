<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToItemrequisicaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('itemrequisicao', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_739knyv4nj73gyrsch0pt46ay')->references(['enti_id'])->on('entidade');
            $table->foreign(['requisicao_req_id'], 'FK_9lp4bpu7ge71o3033i0qh1woh')->references(['req_id'])->on('requisicao');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('itemrequisicao', function (Blueprint $table) {
            $table->dropForeign('FK_739knyv4nj73gyrsch0pt46ay');
            $table->dropForeign('FK_9lp4bpu7ge71o3033i0qh1woh');
        });
    }
}
