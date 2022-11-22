<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSalaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sala', function (Blueprint $table) {
            $table->integer('sala_id', true);
            $table->boolean('encrypted');
            $table->dateTime('sala_data')->nullable();
            $table->string('sala_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_rc1qvyjvnfrjmk8p4ah0x0xmg');
            $table->integer('escola_esc_id')->nullable()->index('FK_oufefojirb3860t33r740oybr');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sala');
    }
}
