<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToRequisicaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('requisicao', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_7falwqwg4kgiadq71fih8ktew')->references(['enti_id'])->on('entidade');
            $table->foreign(['funcionario_func_id'], 'FK_k8gdenp9s9gtsh4sckx68n9dp')->references(['func_id'])->on('funcionario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('requisicao', function (Blueprint $table) {
            $table->dropForeign('FK_7falwqwg4kgiadq71fih8ktew');
            $table->dropForeign('FK_k8gdenp9s9gtsh4sckx68n9dp');
        });
    }
}
