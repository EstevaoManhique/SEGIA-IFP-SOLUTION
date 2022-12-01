<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToTransferenciaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('transferencia', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_5xjx6fhh1fg1ma2jlfdwcxttp')->references(['enti_id'])->on('entidade');
            $table->foreign(['entidade2_enti_id'], 'FK_lhm6etrpb1kh7qlifece1fd1y')->references(['enti_id'])->on('entidade');
            $table->foreign(['aluno_alun_id'], 'FK_6syssbmsi1avt5xd5o40cpan6')->references(['alun_id'])->on('aluno');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('transferencia', function (Blueprint $table) {
            $table->dropForeign('FK_5xjx6fhh1fg1ma2jlfdwcxttp');
            $table->dropForeign('FK_lhm6etrpb1kh7qlifece1fd1y');
            $table->dropForeign('FK_6syssbmsi1avt5xd5o40cpan6');
        });
    }
}
