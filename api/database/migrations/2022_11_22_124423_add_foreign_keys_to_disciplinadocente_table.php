<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToDisciplinadocenteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('disciplinadocente', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_4hio7nrflk1nhjkrjanf6ncvv')->references(['enti_id'])->on('entidade');
            $table->foreign(['disciplina_disc_id'], 'FK_kg4evqx1x2qw882martam55or')->references(['disc_id'])->on('disciplina');
            $table->foreign(['docente_doce_id'], 'FK_a3myhb0nm58vso67pghet6h1')->references(['doce_id'])->on('docente');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('disciplinadocente', function (Blueprint $table) {
            $table->dropForeign('FK_4hio7nrflk1nhjkrjanf6ncvv');
            $table->dropForeign('FK_kg4evqx1x2qw882martam55or');
            $table->dropForeign('FK_a3myhb0nm58vso67pghet6h1');
        });
    }
}
