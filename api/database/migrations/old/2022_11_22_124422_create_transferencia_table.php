<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransferenciaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transferencia', function (Blueprint $table) {
            $table->integer('trans_id', true);
            $table->dateTime('trans_data')->nullable();
            $table->string('trans_status')->nullable();
            $table->integer('aluno_alun_id')->nullable()->index('FK_6syssbmsi1avt5xd5o40cpan6');
            $table->integer('entidade_enti_id')->nullable()->index('FK_5xjx6fhh1fg1ma2jlfdwcxttp');
            $table->integer('entidade2_enti_id')->nullable()->index('FK_lhm6etrpb1kh7qlifece1fd1y');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transferencia');
    }
}
