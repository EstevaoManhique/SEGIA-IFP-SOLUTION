<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToSchoolClassCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('school_class_categories', function (Blueprint $table) {
            $table->foreign(['class_categorory_id'], 'school_class_categories_ibfk_2')->references(['id'])->on('class categories')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->foreign(['school_id'], 'school_class_categories_ibfk_1')->references(['id'])->on('schools')->onUpdate('CASCADE')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('school_class_categories', function (Blueprint $table) {
            $table->dropForeign('school_class_categories_ibfk_2');
            $table->dropForeign('school_class_categories_ibfk_1');
        });
    }
}
