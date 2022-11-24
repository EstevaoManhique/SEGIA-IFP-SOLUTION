<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePersonsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('persons', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('name', 50);
            $table->string('surname', 50);
            $table->string('genre', 10);
            $table->string('marital_status', 10);
            $table->string('mother_name', 50);
            $table->string('father_name', 50);
            $table->string('mother_contact', 50);
            $table->string('father_contact', 50);
            $table->date('birth_date')->nullable();
            $table->string('BI_number', 50);
            $table->date('BI_expiration_date')->nullable();
            $table->string('email');
            $table->string('contact', 50);
            $table->integer('nationality_id');
            $table->string('profile_picture')->nullable();
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
        Schema::dropIfExists('persons');
    }
}
