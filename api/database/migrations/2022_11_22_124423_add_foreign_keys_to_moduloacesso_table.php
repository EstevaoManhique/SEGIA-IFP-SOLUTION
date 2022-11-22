<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToModuloacessoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('moduloacesso', function (Blueprint $table) {
            $table->foreign(['sistema_sist_id'], 'FK_jc0kkxavfkfp4f0yb1d3iyod8')->references(['sist_id'])->on('sistema');
            $table->foreign(['entidadeenti_enti_id'], 'FK_ksdsgaq9vxjai8v1e06a344e1')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('moduloacesso', function (Blueprint $table) {
            $table->dropForeign('FK_jc0kkxavfkfp4f0yb1d3iyod8');
            $table->dropForeign('FK_ksdsgaq9vxjai8v1e06a344e1');
        });
    }
}
