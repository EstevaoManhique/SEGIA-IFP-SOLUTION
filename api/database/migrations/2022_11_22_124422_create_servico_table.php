<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateServicoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('servico', function (Blueprint $table) {
            $table->integer('serv_id', true);
            $table->boolean('encrypted');
            $table->string('serv_descricao')->nullable();
            $table->string('serv_informacoes')->nullable();
            $table->double('serv_valor');
            $table->integer('entidade_enti_id')->nullable()->index('FK_4achjjr0xbks5n9k1wbkbrued');
            $table->integer('horariohora_hora_id')->nullable()->index('FK_axqvf43v4v6i1mbm6aphcm851');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('servico');
    }
}
