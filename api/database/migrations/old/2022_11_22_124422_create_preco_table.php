<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePrecoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('preco', function (Blueprint $table) {
            $table->integer('pre_id', true);
            $table->double('pre_valor');
            $table->integer('entidade_enti_id')->nullable()->index('FK_giqja0oe0jkxn2qto934lj3k7');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('preco');
    }
}
