<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLembreteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lembrete', function (Blueprint $table) {
            $table->integer('lemb_id', true);
            $table->boolean('encrypted');
            $table->dateTime('lemb_data')->nullable();
            $table->string('lemb_descricao')->nullable();
            $table->longText('lemb_detalhes')->nullable();
            $table->string('lemb_referencia')->nullable();
            $table->boolean('lemb_sent');
            $table->integer('entidade_enti_id')->nullable()->index('FK_3qtx9c5ectk7q1la7jb0vmb8d');
            $table->integer('usuario_usua_id')->nullable()->index('FK_83e03e4682r7v5nyfl0il6kpc');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('lembrete');
    }
}
