<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToFuncionarioTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('funcionario', function (Blueprint $table) {
            $table->foreign(['habilitacao_habi_id'], 'FK_mm6nma58ue2cyv16pqjr7j0gb')->references(['habi_id'])->on('habilitacao');
            $table->foreign(['departamento_dep_id'], 'FK_7enln7j79flqeno2m1akdtvib')->references(['dep_id'])->on('departamento');
            $table->foreign(['cargo_car_id'], 'FK_8hbn26lkhmttkvj53456jqinf')->references(['car_id'])->on('cargo');
            $table->foreign(['pessoapess_pess_id'], 'FK_gvnobskteqgnk8i1tf3e80bqy')->references(['pess_id'])->on('pessoa');
            $table->foreign(['firmafirm_firm_id'], 'FK_7iig7u2dakc9dqvtqfako35rv')->references(['firm_id'])->on('firma');
            $table->foreign(['Entidade_enti_id'], 'FK_asduo33c7kpj1pu8m53bgo21k')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('funcionario', function (Blueprint $table) {
            $table->dropForeign('FK_mm6nma58ue2cyv16pqjr7j0gb');
            $table->dropForeign('FK_7enln7j79flqeno2m1akdtvib');
            $table->dropForeign('FK_8hbn26lkhmttkvj53456jqinf');
            $table->dropForeign('FK_gvnobskteqgnk8i1tf3e80bqy');
            $table->dropForeign('FK_7iig7u2dakc9dqvtqfako35rv');
            $table->dropForeign('FK_asduo33c7kpj1pu8m53bgo21k');
        });
    }
}
