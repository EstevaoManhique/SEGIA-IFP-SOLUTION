<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSchoolsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('schools', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('cod_escola')->nullable();
            $table->string('esc_contacto')->nullable();
            $table->string('esc_descricao')->nullable();
            $table->string('esc_distrito')->nullable();
            $table->string('esc_endereco')->nullable();
            $table->string('esc_provincia')->nullable();
            $table->integer('esc_salas')->default(0);
            $table->double('esc_saldo')->default(0);
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('schools');
    }
}
