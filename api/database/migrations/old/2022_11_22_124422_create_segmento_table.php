<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSegmentoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('segmento', function (Blueprint $table) {
            $table->integer('seg_id', true);
            $table->boolean('encrypted');
            $table->string('seg_categoria')->nullable();
            $table->string('seg_descricao')->nullable();
            $table->integer('seg_numero');
            $table->integer('entidade_enti_id')->nullable()->index('FK_nake4dksuegpookjkt7yi7bk2');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('segmento');
    }
}
