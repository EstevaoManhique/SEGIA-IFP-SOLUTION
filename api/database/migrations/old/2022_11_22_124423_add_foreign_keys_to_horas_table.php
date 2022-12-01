<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToHorasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('horas', function (Blueprint $table) {
            $table->foreign(['funcionario_func_id'], 'FK_283l5evl1uv8otjdkda4nl4w1')->references(['func_id'])->on('funcionario');
            $table->foreign(['Entidade_enti_id'], 'FK_dib40nsrei872umfjtkxdh23c')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('horas', function (Blueprint $table) {
            $table->dropForeign('FK_283l5evl1uv8otjdkda4nl4w1');
            $table->dropForeign('FK_dib40nsrei872umfjtkxdh23c');
        });
    }
}
