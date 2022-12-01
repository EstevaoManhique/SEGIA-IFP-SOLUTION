<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('conta', function (Blueprint $table) {
            $table->integer('con_id', true);
            $table->bigInteger('con_codigo');
            $table->string('con_nome')->nullable();
            $table->double('con_saldo');
            $table->boolean('encrypted');
            $table->integer('cliente_clie_id')->nullable()->index('FK_nex8koc1uo9mlnrdfjcguwjw9');
            $table->integer('entidade_enti_id')->nullable()->index('FK_sjijacd720ikrpj8citoj25e5');
            $table->integer('tipoConta_tip_id')->nullable()->index('FK_asdv8b3rjfjtilsw5hftw7eoe');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('conta');
    }
}
