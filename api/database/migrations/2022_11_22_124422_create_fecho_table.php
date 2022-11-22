<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFechoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fecho', function (Blueprint $table) {
            $table->integer('fech_id', true);
            $table->boolean('encrypted');
            $table->dateTime('fech_data')->nullable();
            $table->string('fech_referencia')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_j2jny3mpptg4l9eb65ydhgrt7');
            $table->integer('usuario_usua_id')->nullable()->index('FK_a2pypwlps868k2h25ijd3x4c9');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('fecho');
    }
}
