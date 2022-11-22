<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToCaixaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('caixa', function (Blueprint $table) {
            $table->foreign(['departamento_dep_id'], 'FK_2mu894nt40t16ldsyngkbgdiq')->references(['dep_id'])->on('departamento');
            $table->foreign(['entidade_enti_id'], 'FK_nltlbgf39bw31uim62xof7xom')->references(['enti_id'])->on('entidade');
            $table->foreign(['usuario_usua_id'], 'FK_84bo5166rmesb0lo963phjpq5')->references(['usua_id'])->on('usuario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('caixa', function (Blueprint $table) {
            $table->dropForeign('FK_2mu894nt40t16ldsyngkbgdiq');
            $table->dropForeign('FK_nltlbgf39bw31uim62xof7xom');
            $table->dropForeign('FK_84bo5166rmesb0lo963phjpq5');
        });
    }
}
