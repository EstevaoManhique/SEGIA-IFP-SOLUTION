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
            Schema::create('course_school', function (Blueprint $table) {
                $table->integer("course_id")->constrained();
                $table->integer("school_id")->constrained();
                $table->foreign("course_id")
                        ->references('id')
                        ->on("courses")
                        ->onDelete("cascade");
                $table->foreign("school_id")
                    ->references('id')
                    ->on("schools")
                    ->onDelete("cascade");
            });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('course_table1_ifp');
    }
};
