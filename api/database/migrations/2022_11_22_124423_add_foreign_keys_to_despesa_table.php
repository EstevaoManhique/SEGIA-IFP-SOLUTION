<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToDespesaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('despesa', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_ix6fw0l8nm6vwwdxgs9s12wi1')->references(['enti_id'])->on('entidade');
            $table->foreign(['tipoDespesa_tipd_id'], 'FK_ob59rwsh7ee50cnugp7xckkri')->references(['tipd_id'])->on('tipodespesa');
            $table->foreign(['usuario_usua_id'], 'FK_jhsaoifwu41688cg6seyh6ybr')->references(['usua_id'])->on('usuario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('despesa', function (Blueprint $table) {
            $table->dropForeign('FK_ix6fw0l8nm6vwwdxgs9s12wi1');
            $table->dropForeign('FK_ob59rwsh7ee50cnugp7xckkri');
            $table->dropForeign('FK_jhsaoifwu41688cg6seyh6ybr');
        });
    }
}
