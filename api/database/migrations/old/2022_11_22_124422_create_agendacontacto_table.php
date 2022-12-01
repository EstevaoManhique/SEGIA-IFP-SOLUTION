<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAgendacontactoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('agendacontacto', function (Blueprint $table) {
            $table->integer('agc_id', true);
            $table->string('agc_descricao')->nullable();
            $table->boolean('encrypted');
            $table->integer('cliente_clie_id')->nullable()->index('FK_20t05635ee2d1ao4et3olhg3m');
            $table->integer('entidade_enti_id')->nullable()->index('FK_dalbjoormil0teywq3qq9dqvk');
            $table->integer('fornecedor_for_id')->nullable()->index('FK_e4pp2pqoiae206duif7dwtkt3');
            $table->integer('funcionario_func_id')->nullable()->index('FK_58w7bp1psw78epuvw8s7kii18');
            $table->integer('tipoContacto_tipc_id')->nullable()->index('FK_o1pybgirwo21hn32lt6pyyi3j');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('agendacontacto');
    }
}
