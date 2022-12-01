<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToClassSubjectsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('class_subjects', function (Blueprint $table) {
            $table->foreign(['subject_id'], 'class_subjects_ibfk_2')->references(['id'])->on('students')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->foreign(['class_id'], 'class_subjects_ibfk_1')->references(['id'])->on('classes')->onUpdate('CASCADE')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('class_subjects', function (Blueprint $table) {
            $table->dropForeign('class_subjects_ibfk_2');
            $table->dropForeign('class_subjects_ibfk_1');
        });
    }
}
