<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRequisicaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('requisicao', function (Blueprint $table) {
            $table->integer('req_id', true);
            $table->boolean('encrypted');
            $table->dateTime('req_data')->nullable();
            $table->string('req_serie')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_7falwqwg4kgiadq71fih8ktew');
            $table->integer('funcionario_func_id')->nullable()->index('FK_k8gdenp9s9gtsh4sckx68n9dp');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('requisicao');
    }
}
