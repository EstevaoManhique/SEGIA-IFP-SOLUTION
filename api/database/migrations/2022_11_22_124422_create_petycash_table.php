<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePetycashTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('petycash', function (Blueprint $table) {
            $table->integer('pet_id', true);
            $table->boolean('encrypted');
            $table->dateTime('pet_data')->nullable();
            $table->longText('pet_descricao')->nullable();
            $table->double('pet_saldoAnterior');
            $table->double('pet_valor');
            $table->integer('entidade_enti_id')->nullable()->index('FK_orvmwxycgqy4xmatsyu7gwr88');
            $table->integer('funcionario_func_id')->nullable()->index('FK_dk2s8208hgpkswub1mw8ijbsu');
            $table->integer('pety_pety_id')->nullable()->index('FK_ltkehpnnjldfkdcs956udkaph');
            $table->integer('usuario_usua_id')->nullable()->index('FK_9m9qm0m3h894fd2ttfad9br3q');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('petycash');
    }
}
