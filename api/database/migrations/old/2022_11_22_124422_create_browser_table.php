<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBrowserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('browser', function (Blueprint $table) {
            $table->integer('bro_id', true);
            $table->dateTime('bro_data')->nullable();
            $table->string('bro_descricao')->nullable();
            $table->string('bro_lembre')->nullable();
            $table->integer('usuario_usua_id')->nullable()->index('FK_nf9r0bemspgneg8ixbm91f98r');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('browser');
    }
}
