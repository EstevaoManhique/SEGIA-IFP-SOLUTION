<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('log', function (Blueprint $table) {
            $table->integer('log_id', true);
            $table->boolean('encrypted');
            $table->dateTime('log_data')->nullable();
            $table->string('log_descricao')->nullable();
            $table->string('log_hora')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_53yj8pgaidsaeif40iu3ltj7k');
            $table->integer('sistema_sist_id')->nullable()->index('FK_17hwvurguvvlewxi4utq6fe59');
            $table->integer('usuario_usua_id')->nullable()->index('FK_hrw7vv9m5xq0synxuq10kmfay');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('log');
    }
}
