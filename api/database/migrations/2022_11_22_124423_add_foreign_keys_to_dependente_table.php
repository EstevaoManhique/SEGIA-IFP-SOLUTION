<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToDependenteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('dependente', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_24wnkht2g6i5k24m07kxyd2ug')->references(['enti_id'])->on('entidade');
            $table->foreign(['funcionario_func_id'], 'FK_7qbhfckctc3jpv2acc94d8eco')->references(['func_id'])->on('funcionario');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('dependente', function (Blueprint $table) {
            $table->dropForeign('FK_24wnkht2g6i5k24m07kxyd2ug');
            $table->dropForeign('FK_7qbhfckctc3jpv2acc94d8eco');
        });
    }
}
