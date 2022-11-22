<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToFormacaoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('formacao', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_gik3tgutl9uodaf2q94scyv3g')->references(['enti_id'])->on('entidade');
            $table->foreign(['funcionario_func_id'], 'FK_p83i1d8a2jqrag3wv0hwjedrj')->references(['func_id'])->on('funcionario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('formacao', function (Blueprint $table) {
            $table->dropForeign('FK_gik3tgutl9uodaf2q94scyv3g');
            $table->dropForeign('FK_p83i1d8a2jqrag3wv0hwjedrj');
        });
    }
}
