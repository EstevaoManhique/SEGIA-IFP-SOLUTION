<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBoletimTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('boletim', function (Blueprint $table) {
            $table->integer('bole_id', true);
            $table->longText('bole_descricao')->nullable();
            $table->string('bole_periodo')->nullable();
            $table->string('bole_status')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_86y8cp7luvxmoq2mnrfqw7ivf');
            $table->integer('inscricao_insc_id')->nullable()->index('FK_om82qwj8rf5r3grbk5so4yxd8');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('boletim');
    }
}
