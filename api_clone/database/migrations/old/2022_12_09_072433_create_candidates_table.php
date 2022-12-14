<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('candidates', function (Blueprint $table) {
            $table->increments("id");
            $table->string("nome");
            $table->string("outrosNomes");
            $table->foreignId("contact_id");
            $table->string("birth_date");
            //Qualquer documento de identificacao
            $table->string("identificacao");
            $table->integer("gender_id");
            $table->integer("district_id");
            $table->integer("school_id");
            $table->integer("course_id"); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('candidates');
    }
};
