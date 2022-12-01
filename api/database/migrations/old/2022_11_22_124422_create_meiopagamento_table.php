<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMeiopagamentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('meiopagamento', function (Blueprint $table) {
            $table->integer('meio_id', true);
            $table->boolean('encrypted');
            $table->string('meio_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_8lf5vr0g0jmtxi28w4q3sotj8');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('meiopagamento');
    }
}
