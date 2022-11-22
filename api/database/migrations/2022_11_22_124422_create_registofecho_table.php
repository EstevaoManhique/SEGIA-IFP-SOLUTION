<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRegistofechoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('registofecho', function (Blueprint $table) {
            $table->integer('regf_id', true);
            $table->dateTime('regf_data')->nullable();
            $table->integer('regf_qtd');
            $table->integer('entidade_enti_id')->nullable()->index('FK_gc4430dvlvhhefsyik11qrmvs');
            $table->integer('fecho_fech_id')->nullable()->index('FK_f060lgbl3b9vy1jxd4i75mfe0');
            $table->integer('produto_pro_id')->nullable()->index('FK_fgmxjvb8v0ba0ck8akdt7bj90');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('registofecho');
    }
}
