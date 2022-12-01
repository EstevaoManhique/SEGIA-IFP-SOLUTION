<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAgendacontactoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('agendacontacto', function (Blueprint $table) {
            $table->foreign(['cliente_clie_id'], 'FK_20t05635ee2d1ao4et3olhg3m')->references(['clie_id'])->on('cliente');
            $table->foreign(['entidade_enti_id'], 'FK_dalbjoormil0teywq3qq9dqvk')->references(['enti_id'])->on('entidade');
            $table->foreign(['tipoContacto_tipc_id'], 'FK_o1pybgirwo21hn32lt6pyyi3j')->references(['tipc_id'])->on('tipocontacto');
            $table->foreign(['funcionario_func_id'], 'FK_58w7bp1psw78epuvw8s7kii18')->references(['func_id'])->on('funcionario');
            $table->foreign(['fornecedor_for_id'], 'FK_e4pp2pqoiae206duif7dwtkt3')->references(['for_id'])->on('fornecedor');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('agendacontacto', function (Blueprint $table) {
            $table->dropForeign('FK_20t05635ee2d1ao4et3olhg3m');
            $table->dropForeign('FK_dalbjoormil0teywq3qq9dqvk');
            $table->dropForeign('FK_o1pybgirwo21hn32lt6pyyi3j');
            $table->dropForeign('FK_58w7bp1psw78epuvw8s7kii18');
            $table->dropForeign('FK_e4pp2pqoiae206duif7dwtkt3');
        });
    }
}
