<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFirmaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('firma', function (Blueprint $table) {
            $table->integer('firm_id', true);
            $table->boolean('encrypted');
            $table->string('firm_contacto')->nullable();
            $table->string('firm_descricao')->nullable();
            $table->string('firm_endereco')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_d5jmo64oggci0jrax2wwci3qx');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('firma');
    }
}
