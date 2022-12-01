<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToCategoriaprodutoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('categoriaproduto', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_56q3cja2toqw8xna7maeddhox')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('categoriaproduto', function (Blueprint $table) {
            $table->dropForeign('FK_56q3cja2toqw8xna7maeddhox');
        });
    }
}
