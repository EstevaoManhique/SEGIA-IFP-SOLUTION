<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContacorrenteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contacorrente', function (Blueprint $table) {
            $table->integer('coco_id', true);
            $table->double('coco_credito');
            $table->dateTime('coco_data')->nullable();
            $table->double('coco_debito');
            $table->string('coco_documento')->nullable();
            $table->double('coco_saldo');
            $table->boolean('encrypted');
            $table->integer('cliente_clie_id')->nullable()->index('FK_14l1faakxfivcksjppmw695x4');
            $table->integer('entidade_enti_id')->nullable()->index('FK_pnihc8swojf73k4mvlu7bnsm4');
            $table->integer('usuario_usua_id')->nullable()->index('FK_70irf027dlsm901xfflndo8m1');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contacorrente');
    }
}
