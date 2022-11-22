<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToFolhasalarialTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('folhasalarial', function (Blueprint $table) {
            $table->foreign(['funcionario_func_id'], 'FK_4s3mlynr6yl3p8bxo09c4wgwx')->references(['func_id'])->on('funcionario');
            $table->foreign(['entidade_enti_id'], 'FK_53fqtis9ydqbgfg7gtge9afxl')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('folhasalarial', function (Blueprint $table) {
            $table->dropForeign('FK_4s3mlynr6yl3p8bxo09c4wgwx');
            $table->dropForeign('FK_53fqtis9ydqbgfg7gtge9afxl');
        });
    }
}
