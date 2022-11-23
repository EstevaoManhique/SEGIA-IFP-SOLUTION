<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToActaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('acta', function (Blueprint $table) {
            $table->foreign(['escola_esc_id'], 'FK_ikxryj1skdd6myt9vg56s3l3p')->references(['esc_id'])->on('escola');
            $table->foreign(['entidade_enti_id'], 'FK_rdggjixm1br6m0q43qppai9ec')->references(['enti_id'])->on('entidade');
            $table->foreign(['convocatoria_conv_id'], 'FK_jdk8fs8ddg0l1audjacebf9ni')->references(['conv_id'])->on('convocatoria');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('acta', function (Blueprint $table) {
            $table->dropForeign('FK_ikxryj1skdd6myt9vg56s3l3p');
            $table->dropForeign('FK_rdggjixm1br6m0q43qppai9ec');
            $table->dropForeign('FK_jdk8fs8ddg0l1audjacebf9ni');
        });
    }
}
